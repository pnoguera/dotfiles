#!/usr/bin/env bash

# Install font required for the status bar
sudo apt-get install fonts-font-awesome \
                     conky \
                     parcellite \
                     xss-lock \
                     suckless-tools \
                     rofi \
                     feh

# yagostatus
echo "Installing yagostatus bar"
go get github.com/burik666/yagostatus

# autodisplay
echo "Installing autodisplay"
apt-get -y install autorandr
# curl -L https://github.com/lpicanco/i3-autodisplay/releases/download/v0.2/i3-autodisplay-0.2-linux-amd64 -o ~/bin/i3-autodisplay
# chmod +x ~/bin/i3-autodisplay

# Configure i3lock before suspend
[ -d ~/.config/systemd ] && echo "Deleting .config/systemd" && rm -rf ~/.config/systemd
ln -s $PWD/systemd ~/.config/
systemctl --user enable i3lock
