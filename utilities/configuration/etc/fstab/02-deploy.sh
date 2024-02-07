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

# Exit immediately if any command fails (set -e)
# Print each command that is being executed (set -x)
set -ex

# Call the subprograms in sequence
source subprograms/01-define-path-to-here.sh
source subprograms/02-define-date.sh
source subprograms/03-define-sources.sh
source subprograms/04-define-targets.sh
source subprograms/05-define-directories.sh
source subprograms/06-backup-local.sh
# source subprograms/07-backup-remote.sh
# source subprograms/08-create-modifications.sh
source subprograms/09-deploy-modifications.sh
# source subprograms/10-tar-gzip-files.sh