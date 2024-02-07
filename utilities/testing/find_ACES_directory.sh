#!/bin/bash

set -ex

# Get the directory where the script is stored
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_directory"

search_directory="/opt/Autodesk/"

# Find any file in any subdirectory of $search_directory with a name ending in '.py' and write the result to the output file
find "$search_directory" -type d -name 'ACES*'