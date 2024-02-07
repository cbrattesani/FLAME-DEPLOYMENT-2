#!/bin/bash

# -------------------------------------------------------------------------- #

# This script runs shell scripts with the correct user (uid) & group (gid).
# This functionality is necessary for archiving flame projects.

# It must be run as root (in order to be able to switch uid & gid).
# The target shell scripts must have execute permissions for everyone.

# -------------------------------------------------------------------------- #

# These commands set a varible called 'separator'
# The inner printf command printf -- '=%.0s' {1..75} generates 75 '-' symbols.
# The output is then passed as an argument '%s'to the outer printf command.
# The outer printf command encloses the string with '# ' and ' #'.
separator=$(printf '# %s #' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #

directory="/home/pman/Documents/test"

cd ${directory}

# Loop through each file in the directory
for file in "$directory"/*; do
  # Check if it's a regular file
  if [ -f "${file}" ]; then
    # Get the uid & gid
    uid=$(stat -c "%u" "${file}")
    gid=$(stat -c "%g" "${file}")
    # Get the username & groupname
    username=$(getent passwd "${uid}" | cut -d ':' -f 1)
    groupname=$(getent group "${gid}" | cut -d ':' -f 1)
    # Get the filename (not the entire path)
    filename=$(basename "${file}")
    # Report the results to the shell
    echo "${separator}"
    echo "Filename: ${filename}"
    echo "${separator}"
    echo "UID: ${uid}, Username: ${username}"
    echo "${separator}"
    echo "GID: ${gid}, Groupname: ${groupname}"
    echo "${separator}"
    # Execute the shell script with the appropriate uid & gid
    runuser -u "${username}" -g "${groupname}" ./"${filename}"
  fi
done
