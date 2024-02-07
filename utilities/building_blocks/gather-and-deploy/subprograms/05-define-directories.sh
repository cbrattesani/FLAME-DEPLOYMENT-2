#!/bin/bash

# ========================================================================== #

# This script is a component of a program designed to backup files from
# individual workstations, and prepare modified files for redeployment.

#     A local backup is created.
#     A remote backup is created.
#     A remote file is created in preparation for modification.
#     The modified files are deployed.
#     The backup files and the modification files are tar-gzipped.

# Each program (01-gather.sh, 02-deploy.sh, 03-tidy-up.sh) uses:

#     01-define-path-to-here.sh
#     02-define-date.sh
#     03-define-sources.sh
#     04-define-targets.sh
#     05-define-directories.sh
#     06-backup-local.sh
#     07-backup-remote.sh
#     08-create-modifications.sh
#     09-deploy-modifications.sh
#     10-tar-gzip-files.sh

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
