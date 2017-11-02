#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


if [ -f /etc/debian_version ]; then
    apt-get install 
        vim \
        python-requests
fi
