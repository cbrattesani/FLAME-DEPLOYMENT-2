#!/bin/bash

set -ex

# Get the directory where the script is stored
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_directory"

search_directory="/opt/Autodesk/presets/2025.pr192/shotgun/"

# Create a file to store all Python files
python_files_file="the_shotgrid_python_files.txt"

# Create a file to store instances of 'burn'
burn_results_file="the_shotgrid_python_files_mentioning_burn.txt"

# Find any file in any subdirectory of $search_directory with a name ending in '.py' and write the result to the output file
find "$search_directory" -type f -name '*.py' > "$python_files_file"

# Search each .py file for the string 'burn' and write the result to the new file
while IFS= read -r file; do
    while IFS= read -r line; do
        if [[ $line == *"burn"* ]]; then
            echo "File: $file, Line: $line" >> "$burn_results_file"
        fi
    done < "$file"
done < "$python_files_file"

echo "Search completed. Results saved in $burn_results_file"
