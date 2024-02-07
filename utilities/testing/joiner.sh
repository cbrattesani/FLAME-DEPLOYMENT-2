#!/bin/bash

# Define the path to the current script
path_to_here=$(cd "$(dirname "$0")" && pwd)

# Change directory to the script location
cd "$path_to_here" || exit 1

# Create a new build file named 'build-YYYY-MM-DD.sh'
build_file="build-$(date +%Y-%m-%d).sh"
touch "$build_file" || exit 1

# Copy '01-docstring.sh' to the build file
cp "subprograms/01-docstring.sh" "$build_file" || exit 1

# Extract version and modified information from '01-docstring.sh'
version=$(grep -oP '(^# Version:\s*)\K[^\n]*' "$build_file")
modified=$(grep -oP '(^# Modified:\s*)\K[^\n]*' "$build_file")

# Increment version number
next_version=$(awk -F. -v OFS=. '{ $NF++; print }' <<< "$version")

# Use 'sed' to replace necessary strings in the build file with correct whitespace
sed -i -e "s/^\(# Version:\s*\)[0-9.]\+/\1$next_version/" "$build_file" || exit 1
sed -i -e "s/^\(# Modified:\s*\)[0-9-]\+/\1$(date +%Y-%m-%d)/" "$build_file" || exit 1

# Prompt user for changelist details
echo "Enter Changelist information (Press Ctrl+D when finished):"
changelist=$(cat -)

# Confirm the entered changelist
echo "Entered Changelist:\n$changelist"
read -p "Is this correct? (y/n): " confirmation

if [[ $confirmation =~ ^[Yy]$ ]]; then
    # Update the build file with the modified content
    sed -i -e "/^# Changelist:\s*/c\# Changelist:       $changelist" "$build_file" || exit 1
else
    echo "Changelist not confirmed. Exiting."
    exit 1
fi

# Get the list of subprogram files dynamically
files=(subprograms/*.sh)

# Check if any subprogram files exist
if [ ${#files[@]} -eq 0 ]; then
    echo "Error: No subprogram files found."
    exit 1
fi

# Copy the remaining subprogram files to the build file
for file in "${files[@]}"; do
    # Skip '01-docstring.sh' as it has already been copied
    [ "$file" == "subprograms/01-docstring.sh" ] && continue
    cat "$file" >> "$build_file" || exit 1
done

echo "Build completed successfully: $build_file"
