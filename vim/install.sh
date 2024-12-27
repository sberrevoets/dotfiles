#!/bin/bash

echo "Installing vim plugins"
vim +PlugInstall +qall

mkdir -p ~/.config/nvim/
ln -s $PWD/vim/init.lua ~/.config/nvim/init.lua

python3 -m pip install --user --upgrade pynvim
