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

# Iterate over each modified file
for file in $modified_files; do

  echo "file is $file"

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
    echo "⚠️ No file $filename was found."
    renamed_files=$(git diff --name-status --staged | awk '/^R/ {print $3}')
    created_files=$(git diff --name-status --staged | awk '/^A/ {print $2}')
    echo "Created files : $created_files"
    echo "Created file : ${created_files[@]}"
    echo "${filename}"
    echo "Renamed files : $renamed_files"
    echo "Renamed file : ${renamed_files[@]}"
    echo "${filename}"
  
    if [[ " ${renamed_files[@]} " =~ " ${filename} " ]]; then
      echo "It has been renamed."
      # Get the name of the file before it was renamed
      previous_name=$(git diff --name-status --staged | awk '/^R/ {print $2}')
      # Find that file in the target directory
      previous_file_path=$(find "$target_directory" -name "$(basename "$previous_name")")
      # Get the new name of the file
      new_name=$(git diff --name-status --staged | awk '/^R/ {print $3}')
      # Get the new file path
      new_file_path="$(dirname "$previous_file_path")/$new_name"
      # Rename that file with the new name
      echo "Renaming $previous_file_path to $new_file_path"
      mv "$previous_file_path" "$new_file_path"
      # Replace $target_file with the new file
      target_file="$new_file_path"
    elif [[ " ${created_files[@]} " =~ " ${filename} " ]]; then
      echo "It has been created."
      new_file_path="$target_directory/$file"
      mkdir -p "$(dirname "$new_file_path")"  # Ensure the directory exists
      touch "$new_file_path"
      target_file="$new_file_path"
    else
      echo "❌ File has not been renamed, it has not been created ... What happened ?"
      continue
    fi
  fi

  # Ensure the target file exists before attempting to copy
  if [ -f "$file" ]; then
    # Copy the content of the modified file to the target file
    cp "$file" "$target_file"
  
    # Replace 'projectlocal' with '{{projectName}}' in the target file
    sed -i '' 's/projectlocal/{{projectName}}/g' "$target_file"
  
    echo "✅ Successfully pasted file $filename"
  else
    echo "❌ Source file $file does not exist. Skipping."
  fi
done
