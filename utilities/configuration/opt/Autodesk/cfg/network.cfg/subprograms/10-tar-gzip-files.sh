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