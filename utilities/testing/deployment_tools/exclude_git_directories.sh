#!/bin/bash

# Set source and target directories
source_directory="/home/pman/workspace/BitBucket/logik_python/Scripts"
target_directory="/opt/Autodesk/shared/python/logik_python/Scripts"

# Create array of subdirectories in source directory
declare -a subdirectories=()
while IFS= read -r -d '' dir; do
    if [[ -d "$dir" && ! "$dir" =~ /\.git.* ]]; then # ignore directories starting with ".git"
        subdirectories+=("$dir")
    fi
done < <(find "$source_directory" -type d -print0)

# # Loop through subdirectories and copy latest version to target directory
# for source_module_directory in "${subdirectories[@]}"; do
#     # Find latest version directory
#     source_module_latest_version=$(ls -v "$source_module_directory" | tail -n 1)
#     if [[ -d "$source_module_directory/$source_module_latest_version" ]]; then
#         # Remove any contents from target directory
#         target_module_directory=$(basename "$source_module_directory")
#         rm -rf "$target_directory/$target_module_directory"
#
#         # Copy files to target directory
#         echo "Copying $source_directory/$source_module_directory/$source_module_latest_version to $target_directory/$target_module_directory/"
#         cp -r "$source_directory/$source_module_directory/$source_module_latest_version" "$target_directory/$target_module_directory/"
#     fi
# done

# Print list of subdirectories to file
printf "%s\n" "${subdirectories[@]}" > subdirectories_list.txt
