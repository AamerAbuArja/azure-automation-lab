#!/bin/bash
set -euo pipefail
# set -v

IFS=$'\n\t'

mapfile -t servers < hosts.ini 

for srv in "${servers[@]}"; do

    ssh -i ~/.ssh/id_rsa adminuser@"$srv" 'bash -s' < ./fullsetup.sh > /dev/null 2>&1 &

done

wait