#!/bin/bash

# ========================================================================== #

# This script is designed to backup files from individual workstations
# and prepare modified files for redeployment.

# It stores the backups and pre-modified files in two separate directories:

#   1. folders specific to the current workstation
#   2. a folder for every workstation called 'ALL'

# The files for modification are hard linked:

#   a. to enable easier modification of all files in one place
#   b. to preserve a simple way to source modified files for redeployment
#   c. to save disk space

# Finally, it prints a message if the backup completed successfully.

# ========================================================================== #

# Exit immediately if any command fails (set -e)
# Print each command that is being executed (set -x)
set -ex

# ========================================================================== #

# Determine the absolute path of the directory where the script is located
path_to_here=$(cd $(dirname "$0") && pwd)

# ========================================================================== #

# Get the current date and time in the format: YYYY-MM-DD_HH-MM
today_now="$(date +%F_%H-%M)"

# ========================================================================== #

# Define paths and filenames for the source file
source_root="/var/tmp/source_folder"
source_filename="source_file.txt"
source_path="$source_root/$source_filename"

# ========================================================================== #

# Define paths and filenames for the target backup file
target_root="/var/tmp/target_folder"
target_filename="target_file.txt"
target_path="$target_root/$target_filename"

# ========================================================================== #

# Define the root directory for storing backup files
backup_root="$path_to_here/backup"

# Define the backup folder specific to the current workstation
backup_folder="$backup_root/$HOSTNAME"

# Create the directory if it does not exist
test -d "$backup_folder" || mkdir -p -m 777 "$backup_folder"

# Define the 'ALL' folder for backups from all workstations
backup_all="$backup_root/ALL"

# Create the directory if it does not exist
test -d "$backup_all" || mkdir -p -m 777 "$backup_all"

# ========================================================================== #

# Define backup_filename with a timestamp and hostname
backup_filename="$source_filename.$today_now.bak.$HOSTNAME"

# Define backup_path specific to the current workstation
backup_path="$backup_folder/$backup_filename"

# Define the backup_path_hard_link path
backup_path_hard_link="$backup_all/$backup_filename"

# Define the filename for the local backup copy
backup_filename_local="$source_filename.$today_now.local_bak.$HOSTNAME"

# ========================================================================== #

# Define the root directory for storing modified files
modifications_root="$path_to_here/modifications"

# Define the modifications folder specific to the current workstation
modifications_folder="$modifications_root/$HOSTNAME"

# Create the directory if it does not exist
test -d "$modifications_folder" || mkdir -p -m 777 $modifications_folder

# Define the 'ALL' folder for modifications from all workstations
modifications_all="$modifications_root/ALL"

# Create the directory if it does not exist
test -d "$modifications_all" || mkdir -p -m 777 "$modifications_all"

# ========================================================================== #

# Define the modifications_filename with a timestamp and hostname
modifications_filename="$source_filename.$today_now.modifications.$HOSTNAME"

# Define modifications_path specific to the current workstation
modifications_path="$modifications_folder/$modifications_filename"

# Define the modifications_path_hard_link path
modifications_path_hard_link="$modifications_all/$modifications_filename"

# ========================================================================== #

# List the contents of the modifications folder
modifications_folder_contents=$(ls $modifications_folder)

# Build a space-separated list of paths to modification files
modifications_list="$modifications_folder/$modifications_folder_contents"

# ========================================================================== #

# Define the root directory for storing tar-gzipped files
tar_gzip_root="$path_to_here/tar-gzip-files"

# Create the directory if it does not exist
test -d "$tar_gzip_root" || mkdir -p -m 777 $tar_gzip_root

# ========================================================================== #

# Create a local backup copy of the source file
cp -v "$source_root/$source_filename" "$source_root/$backup_filename_local"

# Print a confirmation to the shell
echo "A local copy of $source_root/$source_filename has been backed up to:"
echo "$source_root/$backup_filename_local"

# ========================================================================== #

# Create a remote backup copy of the source file
cp -v "$source_root/$source_filename" "$backup_path"

# Create a hard link in 'ALL' folder
ln "$backup_path" "$backup_path_hard_link"

# Print a confirmation to the shell
echo "A remote copy of $source_filename has been backed up to:"
echo "$backup_filename"

# ========================================================================== #

# Create a copy of the source file for modifications
cp -v "$source_root/$source_filename" "$modifications_path"

# Create a hard link in 'ALL' folder
ln "$modifications_path" "$modifications_path_hard_link"

echo "A copy of $source_filename is ready to be modified:"
echo "$modifications_all/$modifications_filename"

# ========================================================================== #

# Copy the list of modifications to the target folder
cp -v "$modifications_list" "$target_folder/$target_filename"

# display the first line of the target file
sed -n '1p' $target_filename

# Print a confirmation to the shell
echo "Modified $target_filename has been deployed to $HOSTNAME"

# ========================================================================== #

# Create tar-gzipped archives of the backup and modifications folders
tar -czvf "$tar_gzip_root/$today_now-backups.tar.gz" $backup_root
tar -czvf "$tar_gzip_root/$today_now-modifications.tar.gz" $modifications_root

# Remove all files in the backup and modifications folders
find $backup_root -type f -exec rm {} +
find $modifications_root -type f -exec rm {} +

echo "the following tar-gzip files have been created:"
echo "$tar_gzip_root/$today_now-backups.tar.gz"
echo "$tar_gzip_root/$today_now-modifications.tar.gz"

# ========================================================================== #
