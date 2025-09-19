#!/bin/bash
set -euo pipefail
# set -v

IFS=$'\n\t'

mapfile -t servers < hosts.ini 

for srv in "${servers[@]}"; do
    ssh -i ~/.ssh/id_rsa adminuser@"$srv" "hostname"
done