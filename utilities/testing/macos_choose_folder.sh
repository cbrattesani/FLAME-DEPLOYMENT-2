#!/bin/bash

# Prompt the macOS user to choose a directory
chosen_dir=$(osascript -e 'POSIX path of (choose folder)' 2>/dev/null)

# Check if the user selected a valid directory
if [[ -z "$chosen_dir" || ! -d "$chosen_dir" ]]; then
  echo "No directory selected or invalid directory specified."
  exit 1
fi

# Display the chosen directory for confirmation
echo "You selected the following directory:"
echo "$chosen_dir"

# Example usage:
# ./choose_directory.sh
# echo "Chosen directory: $chosen_dir"
s