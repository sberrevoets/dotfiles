#!/bin/bash

echo "Installing vim plugins"
vim +PlugInstall +qall

echo "Creating backup dir"
mkdir backupdir -p 2>/dev/null

mkdir -p ~/.config/nvim/
ln -s $PWD/vim/nvim.conf ~/.config/nvim/init.vim

python3 -m pip install --user --upgrade pynvim
