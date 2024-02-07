#!/bin/bash

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# ========================================================================== #
# This section echoes stderr to the shell or quits on error.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Write stderr to shell (-x) & exit upon failure (-e). 
# set -ex

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section defines script info, job info & software details.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Backup Script Name:   backup_thirty_thirty2_2025_delta.sh
# Archive Script for:   thirty_thirty2
# Script Creation Date: 13:49:51

mmm_job_name_prefix="thirty"

mmm_job_name_suffix="thirty2"

mmm_job_name="thirty_thirty2"

flame_software_version="2025"

flame_workstation_name="delta"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section creates decorative separators for blocks of text.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define a variable called 'separator'
separator=$(printf '+ %s +' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section defines variables based on the date.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Current Date & Time Options
current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
today=$(date "+%Y-%m-%d")

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section detects which file browser to use for Linux or macOS.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to choose directory using Zenity or osascript
choose_directory() {
    if command -v zenity &> /dev/null; then
        directory_path=$(zenity --file-selection --directory --title="Select directory")
    elif command -v osascript &> /dev/null; then
        directory_path=$(osascript -e 'POSIX path of (choose folder with prompt "Select directory")')
    else
        echo -e "Error: Zenity or osascript not found."
        echo -e "Please install either tool."
        exit 1
    fi
}

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section defines path info for mmm_job directories.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# set the path for the mmm_root_directory
mmm_root_directory=\
"/JOBS"

# echo ${mmm_root_directory} to the shell
# echo -e "mmm_root_directory:"
# echo -e "  ${mmm_root_directory}"

# -------------------------------------------------------------------------- #

# set the path for the mmm_job_directory
mmm_job_directory=\
"${mmm_root_directory}/${mmm_job_name}"

# echo ${mmm_job_directory} to the shell
# echo -e "mmm_job_directory:"
# echo -e "  ${mmm_job_directory}"

# -------------------------------------------------------------------------- #

# set the path for the mmm_job_rsync_directory
# mmm_job_rsync_directory=\
# "${mmm_job_directory}/backup_scripts"

# echo ${mmm_job_rsync_directory} to the shell
# echo -e "mmm_job_rsync_directory:"
# echo -e "  ${mmm_job_rsync_directory}"

# Make ${mmm_job_rsync_directory} if it doesn't exist
mkdir -p -m 777 "${mmm_job_rsync_directory}"

# -------------------------------------------------------------------------- #

echo -e "\n$separator\n"
echo -e "  Date:             ${today}"
echo -e "  Backing up:       ${mmm_job_name}"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section sets the source directory to be backed up.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the source directory
src_rsync_dir="${mmm_job_directory}"
echo -e "  Source Directory: ${mmm_job_directory}"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section prompts the user to choose a target directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# # Prompt user to choose destination path
# echo -e "\n$separator\n"
# echo -e "  Choose the Backup Directory:"
# choose_directory
# tgt_rsync_dir="${directory_path%/}"
# tgt_dir_name=$(basename "$tgt_rsync_dir")
# echo -e "\n$separator\n"
# echo -e "  Backup Directory: ${tgt_rsync_dir}"
# echo -e "\n$separator\n"

# Set the path for the backup_prefs file
backup_prefs_file="${mmm_root_directory}/backup_prefs"

# Check if backup_prefs file exists
if [ -f "$backup_prefs_file" ]; then
    # Read tgt_rsync_dir from backup_prefs file
    tgt_rsync_dir=$(<"$backup_prefs_file")
else
    # Prompt user to choose destination path
    echo -e "\n$separator\n"
    echo -e "  Choose the Backup Directory:"
    choose_directory
    tgt_rsync_dir="${directory_path%/}"

    # Store tgt_rsync_dir in backup_prefs file
    echo "$tgt_rsync_dir" > "$backup_prefs_file"
fi

tgt_dir_name=$(basename "$tgt_rsync_dir")
echo -e "\n$separator\n"
echo -e "  Backup Directory: ${tgt_rsync_dir}"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section creates a variable to store rsync options.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# The following command is too long:
# 'rsync -av --no-group --no-perms --no-times --size-only --ignore-existing '

# Wrap the rsync options as an array into the variable 'sync_opts_1'
# sync_opts_1=(-av --no-group --no-perms --no-times --size-only --ignore-existing)
sync_opts_1=(-av)

# Wrap more rsync options as an array into the variable 'sync_opts_2'
sync_opts_2=(--copy-links --exclude='.DS_Store' --log-file=$log_file)

# To use the variable in your rsync command
# rsync "${sync_opts_1[@]}" "${sync_opts_2[@]}" src_rsync_dir/ tgt_rsync_dir/

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# ========================================================================== #
# This section backs up the source to the target directory & creates a log.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Create a directory for rsync log files
rsync_log_files="$tgt_rsync_dir/rsync_logs"
mkdir -p $rsync_log_files
echo -e "  Log folder: $rsync_log_files"
echo -e "\n$separator\n"

# Rsync options with log file
log_file="${rsync_log_files}/${today}-backup_log-${mmm_job_name}.txt"
touch $log_file
echo -e "  Log file:   ${log_file}"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

rsync "${sync_opts_1[@]}" \
        "${sync_opts_2[@]}" \
        "${src_rsync_dir}" \
        "${tgt_rsync_dir}" \
        | sed 's/^/  /'
echo -e "  Backup of ${src_rsync_dir} completed."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
