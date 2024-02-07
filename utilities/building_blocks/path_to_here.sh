#!/bin/bash

# -------------------------------------------------------------------------- #

# Store the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# -------------------------------------------------------------------------- #

# echo 'path_to_here' to the shell
echo "The path to this script is: $path_to_here"

# -------------------------------------------------------------------------- #
