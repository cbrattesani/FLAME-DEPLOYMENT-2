#!/bin/bash

directory="/home/pman/workspace/GitHub/FLAME-PYTHON/man_made/deployment_tools/flame/pythonAPI/2025"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist."
    exit 1
fi

# Iterate over Python files in the directory and insert the text
for file in "$directory"/*.py; do
    filename=$(basename "$file")
    filename_without_extension="${filename%.*}"

    # Use sed to insert the text at the beginning of the file
    sed -i "1i\\
import flame\\
from flame import $filename_without_extension\\
" "$file"

    echo "Text inserted into $file"
done
