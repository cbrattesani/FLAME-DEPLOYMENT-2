#!/bin/bash

# -------------------------------------------------------------------------- #

# This script analyzes shell scripts & lists the variable names.

# -------------------------------------------------------------------------- #

# These commands set a variable called 'separator'
# The inner printf command printf -- '=%.0s' {1..75} generates 75 '-' symbols.
# The output is then passed as an argument '%s' to the outer printf command.
# The outer printf command encloses the string with '# ' and ' #'.
separator=$(printf '# %s #' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #
# Set the options to exit upon failure (-e), & write stderr to the shell (-x)
# -------------------------------------------------------------------------- #

# set -ex

# -------------------------------------------------------------------------- #

# Define the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd "$(dirname "$0")" && pwd)

# change directory to path_to_here
cd "$path_to_here"

# -------------------------------------------------------------------------- #

# target_file="variable_names.txt"
target_file="variable_names.txt"

# -------------------------------------------------------------------------- #

# parent_directory="/home/pman/workspace/GitHub/FLAME-DEPLOYMENT/programs/configuration"
parent_directory="/home/pman/workspace/GitHub/FLAME-DEPLOYMENT/programs/configuration"

# script_file="automated_archive_assistant_isilon.sh"
script_file="$parent_directory/opt/Autodesk/wiretap/create_project.sh"

echo "${separator}" > "$target_file"
echo "Analysis of: ${script_file}" >> "$target_file"
echo "${separator}" >> "$target_file"
echo "The variables in this script are:" >> "$target_file"
echo "line_number | variable_length | variable_name" >> "$target_file"
echo "${separator}" >> "$target_file"

line_number=0

# Read the script file line by line
while IFS= read -r line; do
  ((line_number++))

  # Use regular expression to match variable assignments
  if [[ $line =~ ^[[:space:]]*([[:alnum:]_]+)= ]]; then
    variable="${BASH_REMATCH[1]}"
    variable_length=$(echo -n "$variable" | wc -c | tr -d '[:space:]')
    padded_line_number=$(printf "%04d" "${line_number}")
    padded_variable_length=$(printf "%02d" "${variable_length}")
    echo "${padded_line_number} | ${padded_variable_length} | ${variable}" >> "$target_file"
  fi
done < "${script_file}"

echo "${separator}" >> "$target_file"
