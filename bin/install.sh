#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DEST=~/bin

[ -d ${DEST} ] || mkdir ${DEST}

cd $(dirname $0)
for script in *; do
    if [ "${script}" != $(basename "$0") ]; then
        if [ ! -L ${DEST}/${script} ]; then
            echo "installing $script"
            chmod +x ${script}
            ln -s ${PWD}/${script} ~/bin/${script}
        fi
    fi
done
