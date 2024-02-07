#!/bin/bash

# -------------------------------------------------------------------------- #

# This script analyzes shell scripts & lists the variable names.

# -------------------------------------------------------------------------- #

# These commands set a varible called 'separator'
# The inner printf command printf -- '=%.0s' {1..75} generates 75 '-' symbols.
# The output is then passed as an argument '%s'to the outer printf command.
# The outer printf command encloses the string with '# ' and ' #'.
separator=$(printf '# %s #' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #
# Set the options to exit upon failure (-e), & write stderr to the shell (-x)
# -------------------------------------------------------------------------- #

# set -ex

# -------------------------------------------------------------------------- #

# Store the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# -------------------------------------------------------------------------- #

# echo 'path_to_here' to the shell
echo "The path to this script is: $path_to_here"

# -------------------------------------------------------------------------- #

# script_file="automated_archive_assistant_isilon.sh"
script_file="flame_archives_script_body_isilon.sh"

echo "${separator}"
echo "Analysis of: ${script_file}"
echo "${separator}"
echo "The variables in this script are:"
echo "${separator}"

# # Read the script file line by line
# while IFS= read -r line; do
#   # Use regular expression to match variable assignments
#   if [[ $line =~ ^[[:space:]]*([[:alnum:]_]+)= ]]; then
#     variable="${BASH_REMATCH[1]}"
#     echo "$variable"
#   fi
# done < "$script_file"

line_number=0

# Read the script file line by line
while IFS= read -r line; do
  ((line_number++))

  # Use regular expression to match variable assignments
  if [[ $line =~ ^[[:space:]]*([[:alnum:]_]+)= ]]; then
    variable="${BASH_REMATCH[1]}"
    padded_line_number=$(printf "%04d" "${line_number}")
    echo "line ${padded_line_number} - '${variable}'"
  fi
done < "${script_file}"

echo "${separator}"
