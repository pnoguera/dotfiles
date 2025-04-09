#!/usr/bin/env bash

if [ -f /etc/debian_version ]; then
    sudo apt-get -y install \
        vim \
        vim-gtk3 \
        markdown \
        xdotool
fi

# go install github.com/cweill/gotests/...
