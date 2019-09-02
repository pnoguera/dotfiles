#!/bin/bash

which go || (echo "Go isi either not installed or not in \$PATH" && exit 2)

echo "Installing pt"
go get -u github.com/monochromegane/the_platinum_searcher/...

echo "Install black python formatter"
pip3 install black
