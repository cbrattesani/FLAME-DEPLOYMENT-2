#!/bin/bash

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Program Name:     splitter.sh
# Version:          1.0
# Language:         bash script
# Flame Version:    2025.x
# Author:           Phil MAN - phil_man@mac.com
# Toolset:          MAN_MADE_MATERIAL
# Created:          2024-02-03
# Modified:         2024-02-03
# Modifier:         Phil MAN - phil_man@mac.com

# Changelist:       Fixed Syncolor policies.

# -------------------------------------------------------------------------- #

# Description:      This program splits the create_flame_projects.sh into
#                   smaller blocks of code.

# Installation:     Copy the 'FLAME-DEPLOYMENT' repo to your home directory,

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section defines a variable for the path to the running program.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# change directory to path_to_herea
cd $path_to_here

# change directory to parent of path_to_here
cd ../

# -------------------------------------------------------------------------- #

# Create the subprograms folder if it doesn't exist
mkdir -p subprograms

# -------------------------------------------------------------------------- #

# Set the source file and delimiter
source_file="create_flame_projects.sh"
delimiter="# END OF CODE BLOCK"

# -------------------------------------------------------------------------- #

# Counter for subprogram filenames
counter=1

# -------------------------------------------------------------------------- #

# Temporary variable to store the current subprogram content
subprogram_content=""

# -------------------------------------------------------------------------- #

# Read the source file line by line
while IFS= read -r line; do
    if [[ $line == "$delimiter" ]]; then
        # Write the content to the subprogram file
        echo -e "$subprogram_content" > "subprograms/$(printf "%02d.sh" $counter)"
        
        # Reset the subprogram content and increment the counter
        subprogram_content=""
        ((counter++))
    else
        # Append the line to the current subprogram content
        subprogram_content+="$line\n"
    fi
done < "$source_file"

# -------------------------------------------------------------------------- #

echo "Subprograms created in the 'subprograms' folder."

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
