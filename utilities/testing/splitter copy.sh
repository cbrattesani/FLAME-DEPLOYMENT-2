#!/bin/bash

# ========================================================================== #
# This section defines a variable for the path to the running program.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# change directory to path_to_here
cd $path_to_here

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# Create the subprograms folder if it doesn't exist
mkdir -p subprograms

# -------------------------------------------------------------------------- #

# Set the source file and delimiter
source_file="code.sh"
delimiter="DELIMITER"

# -------------------------------------------------------------------------- #

# Read the source file and split into subprograms
csplit --suppress-matched "$source_file" "/$delimiter/+1" "{*}"

# -------------------------------------------------------------------------- #

# Move the subprogram files to the subprograms folder
mv xx* subprograms/

# -------------------------------------------------------------------------- #

# Optional: Rename the subprogram files with zero-padded counter
cd subprograms || exit
counter=1
for file in *; do
    # Zero-pad the counter to two digits
    padded_counter=$(printf "%02d" "$counter")
    new_name="${padded_counter}.sh"
    mv "$file" "$new_name"
    ((counter++))
done

# -------------------------------------------------------------------------- #

echo "Subprograms created in the 'subprograms' folder."

# -------------------------------------------------------------------------- #
