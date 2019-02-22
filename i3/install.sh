#!/usr/bin/env bash

# Install font required for the status bar
sudo apt-get install fonts-font-awesome

# Configure i3lock before suspend
[ -d ~/.config/systemd ] && echo "Deleting .config/systemd" && rm -rf ~/.config/systemd
ln -s $PWD/systemd ~/.config/
systemctl --user enable i3lock
