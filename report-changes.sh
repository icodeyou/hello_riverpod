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
modified_files=$(git diff --name-only --cached)

# Iterate over each modified file
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
    # No matches found, skip to the next file
    echo "❌ No file $filename was found. Maybe it's because you renamed it ?"
    continue
  fi

  # Copy the content of the modified file to the target file
  cp "$file" "$target_file"


  echo "$target_file"
  # Replace 'projectlocal' with '{{projectName}}' in the target file
  sed -i '' 's/projectlocal/{{projectName}}/g' "$target_file"

  echo "✅ Successfully pasted file $filename"
done
