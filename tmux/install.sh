#!/usr/bin/env bash
EXIT=0

echo "Installing tmux"

[ -f /etc/debian_version ] && apt-get install tmux

echo "Installing fonts"

which cmake || (echo "cmake required" && EXIT=1)
which g++ || (echo "g++ required" && EXIT=1)

[ $EXIT -eq 1 ] && exit

# clone
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
# install
cd /tmp/fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
fc-cache -fv
