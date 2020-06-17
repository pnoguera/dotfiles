#!/bin/bash

which go || (echo "Go isi either not installed or not in \$PATH" && exit 2)

echo "Installing pt"
go get -u github.com/monochromegane/the_platinum_searcher/...

echo "Install black python formatter"
pip3 install black

echo "Install Bash-My-AWS"
git clone https://github.com/bash-my-aws/bash-my-aws.git ~/.bash-my-aws

echo "Install various utilities"
apt-get update
apt-get -y install direnv
