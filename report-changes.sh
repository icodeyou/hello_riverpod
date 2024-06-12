#!/bin/bash

# Specify the source directory (where we do git add)
source_directory="LOCAL/"

# Get the directory where the script is located
target_directory=$(dirname "$(realpath "$0")")/__brick__

# Navigate to the source directory
cd "$source_directory" || exit

# Add all changes to the git staging area
git add --all

# Get the list of modified files in the git repository
modified_files=$(git diff --name-only --staged)

modified_files=$(git diff --name-status --staged | awk '/^M/ {print $2}')
renamed_files=$(git diff --name-status --staged | awk '/^R/ {print $3}')
created_files=$(git diff --name-status --staged | awk '/^A/ {print $2}')
deleted_files=$(git diff --name-status --staged | awk '/^D/ {print $2}')
echo ""

# Function to copy the content of a file to another file
copyFile() {
  source_file=$1
  target_file=$2

  # Ensure the target file exists before attempting to copy
  if [[ -f "$source_file" ]] && [[ -f "$target_file" ]]; then
    # Copy the content of the modified file to the target file
    cp "$source_file" "$target_file"

    # Replace 'projectlocal' with '{{projectName}}' in the target file
    sed -i '' 's/projectlocal/{{projectName}}/g' "$target_file"

    echo "✅ Successfully pasted file $source_file" to $target_file
  else
    echo "❌ We tried to copy the content of $source_file to $target_file but one of them does not exist."
  fi
}

## --------------------------- ##
# Iterate over each modified file
echo "➰ Looping over modified files"
for file in $modified_files; do

  # Get the base name of the file (without path)
  filename=$(basename "$file")
  
  # Find matching files in the target directory
  matching_files=($(find "$target_directory" -name "$filename"))

  if [ ${#matching_files[@]} -gt 1 ]; then
    # More than one match found, ask the user which file to update
    echo "Multiple matches found for $filename. Please select the target file:"
    select target_file in "${matching_files[@]}"; do
      if [ -n "$target_file" ]; then
        break
      else
        echo "Invalid selection. Please try again."
      fi
    done
  elif [ ${#matching_files[@]} -eq 1 ]; then
    # Exactly one match found
    target_file=${matching_files[0]}
  else
    # No matches found
    echo "❌ File '$filename' was modified but it is not found in the target directory."
  fi

  copyFile "$file" "$target_file"

done

## --------------------------- ##
# Iterate over each renamed file
echo "➰ Looping over renamed files"
index=0
for renamed_file in ${renamed_files[@]}; do
  index=$((index+1))
  previous_names=$(git diff --name-status --staged | awk '/^R/ {print $2}')
  previous_name=$(echo $previous_names | cut -d ' ' -f $index)
  echo "File has been renamed from $previous_name to $renamed_file."
  mv "$target_directory/$previous_name" "$target_directory/$renamed_file"
  copyFile "$renamed_file" "$target_directory/$renamed_file"
done

## --------------------------- ##
# Iterate over each created file
echo "➰ Looping over created files"
for created_file in ${created_files[@]}; do
  if [[ $created_file == $file ]]; then
    echo "It has been created."
    new_file_path="$target_directory/$file"
    mkdir -p "$(dirname "$new_file_path")"  # Ensure the directory exists
    touch "$new_file_path"
    copyFile "$renamed_file" "$new_file_path"
  fi
done

## --------------------------- ##
# Iterate over each deleted file
echo "➰ Looping over deleted files"
for deleted_file in ${deleted_files[@]}; do
  if [[ $deleted_file == $file ]]; then
    echo "It has been deleted."
    rm -rf "$target_directory/$file"
    echo "✅ Successfully deleted file $file"
  fi
done


