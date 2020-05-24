#!/usr/bin/env bash

if [ -f /etc/debian_version ]; then
    sudo apt-get -y install \
        vim \
        vim-gnome \
        markdown \
        xdotool
fi

go get -u github.com/cweill/gotests/...
