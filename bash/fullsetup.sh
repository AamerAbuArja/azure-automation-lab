#!/bin/bash
set -euo pipefail

sudo apt update && sudo apt upgrade -y

# sudo apt install ansible -y

sudo apt-get install -y python3

mkdir ~/project