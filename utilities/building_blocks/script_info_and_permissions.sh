#!/bin/bash

# -------------------------------------------------------------------------- #

# This script names itself, describes the user (uid) & group (gid) owenership.
# While executing it describes the uid & gid of the user executing the script.

# -------------------------------------------------------------------------- #

# These commands set a varible called 'separator'
# The inner printf command printf -- '=%.0s' {1..75} generates 75 '-' symbols.
# The output is then passed as an argument '%s'to the outer printf command.
# The outer printf command encloses the string with '# ' and ' #'.
separator=$(printf '# %s #' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #

# Set filename
# ${BASH_SOURCE[0]} represents the name of the script being executed
filename="${BASH_SOURCE[0]}"

script_uid=$(stat -c "%u" "$filename")
script_gid=$(stat -c "%g" "$filename")
script_username=$(getent passwd "$script_uid" | cut -d ':' -f 1)
script_groupname=$(getent group "$script_gid" | cut -d ':' -f 1)

# -------------------------------------------------------------------------- #

echo "${separator}"
echo "this script is called: ${filename}"
echo "${separator}"
echo "this file is owned by: ${script_uid} | ${script_username}"
echo "${separator}"
echo "this file is owned by: ${script_gid} | ${script_groupname}"
echo "${separator}"

# -------------------------------------------------------------------------- #

uid=$(id -u)
gid=$(id -g)
username=$(getent passwd "$uid" | cut -d ':' -f 1)
groupname=$(getent group "$gid" | cut -d ':' -f 1)

# -------------------------------------------------------------------------- #

echo "This script is being run by: $(whoami)"
echo "${separator}"
echo "UID: $(id -u) | ${username}"
echo "${separator}"
echo "GID: $(id -g) | ${groupname}"
echo "${separator}"

# -------------------------------------------------------------------------- #
