#!/bin/bash

# Function to get filesystem type
get_filesystem_type() {
    local path="$1"

    # Check if the path is a symbolic link
    if [ -L "$path" ]; then
        # If it is a symbolic link, get the target path
        path=$(readlink -f "$path")
    fi

    # Continue with the rest of the function to get the filesystem type
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        filesystem_type=$(diskutil info "$path" | grep "File System" | awk '{print $NF}')
    elif [[ "$(uname)" == "Linux" ]]; then
        # Linux
        filesystem_type=$(lsblk -no FSTYPE "$path" 2>/dev/null)
    else
        echo "Unsupported operating system."
        exit 1
    fi

    echo "$filesystem_type"
}

# Function to choose folder using zenity or osascript
choose_folder() {
    local folder

    if command -v zenity &> /dev/null; then
        folder=$(zenity --file-selection --directory --title="Choose a folder")
    elif [[ "$(uname)" == "Darwin" ]] && command -v osascript &> /dev/null; then
        folder=$(osascript -e 'tell application "System Events" to choose folder with prompt "Choose a folder:"')
    else
        echo "Error: zenity or osascript not found. Please install either of them to use the file browser."
        exit 1
    fi

    echo "$folder"
}

# Choose folder using zenity or osascript
user_input=$(choose_folder)

# Check if the user canceled the dialog
if [ -z "$user_input" ]; then
    echo "User canceled the operation."
    exit 1
fi

# Get filesystem type of the selected folder
filesystem_type=$(get_filesystem_type "$user_input")

# Check if the filesystem is ZFS
if [ "$filesystem_type" == "zfs" ]; then
    folder_type="zfs_dataset"
else
    folder_type="regular"
fi

echo "Folder type of $user_input: $folder_type"
