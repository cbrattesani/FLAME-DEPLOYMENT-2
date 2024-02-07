#!/bin/bash

# set -ex

# -------------------------------------------------------------------------- #

# Get the path to the current script and store it in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# -------------------------------------------------------------------------- #

# change directory to the target directory
# cd /etc/ssh

# print working directory
pwd

# set 'NOW' to $(date +%Y-%m-%d_%H-%M-%S)
NOW=$(date +%Y-%m-%d_%H-%M-%S)

# set 'ssh_known_hosts_backup_name' to "known_hosts.backup.$NOW_$HOSTNAME"
ssh_known_hosts_backup_name="ssh_known_hosts.backup.${NOW}_${HOSTNAME}"

# if 'ssh_known_hosts' does not exist, create it
if [ ! -f /etc/ssh/ssh_known_hosts ]; then
    touch /etc/ssh/ssh_known_hosts
fi

# create file 'ssh_known_hosts_backup_name'
touch /etc/ssh/${ssh_known_hosts_backup_name}

# write the hostname and date into $ssh_known_hosts_backup_name
echo "# ${ssh_known_hosts_backup_name}" > "/etc/ssh/${ssh_known_hosts_backup_name}"

# make a backup of 'ssh_known_hosts' called $ssh_known_hosts_backup_name
cat /etc/ssh/ssh_known_hosts >> /etc/ssh/${ssh_known_hosts_backup_name}

# ssh-keyscan -p 22 -T 5 -f /home/pman/workspace/BitBucket/scripts-and-programs/bash/ssh/remote_hosts_2451_vlan -H >> /etc/ssh/$ssh_known_hosts_backup_name
ssh-keyscan -p 22 -T 5 -f "$path_to_here/remote_hosts_2451_vlan" -H >> /etc/ssh/ssh_known_hosts

# ssh-keyscan -f remote_hosts | \
# sort -u - /etc/ssh/ssh_known_hosts > /etc/ssh/ssh_known_hosts

echo '/etc/ssh/ssh_known_hosts backed up & refreshed'

# -------------------------------------------------------------------------- #
