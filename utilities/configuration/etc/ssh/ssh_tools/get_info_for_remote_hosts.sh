#!/bin/bash

arp -a | sort | awk '{print $1, $1, $2}' \
> /home/pman/workspace/BitBucket/scripts-and-programs/bash/ssh/remote_hosts
