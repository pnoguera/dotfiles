#!/bin/bash

which go || (echo "Go isi either not installed or not in \$PATH" && exit 2)

echo "Installing pt"
curl -L https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.2.0/pt_linux_amd64.tar.gz|tar xvz -C ~/bin/ --strip 1 pt_linux_amd64/pt

echo "Install black python formatter"
pip3 install black

echo "Install Bash-My-AWS"
git clone https://github.com/bash-my-aws/bash-my-aws.git ~/.bash-my-aws

echo "Install various utilities"
sudo apt-get update
sudo apt-get -y install direnv

echo "Install git-prompt"
mkdir .bash-git-prompt
curl gitprompt.sh -o ~/.bash-git-prompt/gitprompt.sh
