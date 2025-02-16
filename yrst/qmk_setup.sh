#!/bin/bash

sudo apt install -y git python3-pip
python3 -m pip install --user qmk
echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && source $HOME/.bashrc
qmk setup
qmk config user.keyboard=idank/sweeq
qmk config user.keymap=yrst
# qmk new-keymap
# qmk compile -e CONVERT_TO=rp2040_ce
