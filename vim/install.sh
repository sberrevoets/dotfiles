#!/bin/bash

echo "Installing vim plugins"
vim +PlugInstall +qall

echo "Creating backup dir"
mkdir backupdir -p

mkdir ~/.config/nvim/ -p 2>/dev/null
ln -s $PWD/vim/nvim.conf ~/.config/nvim/init.vim
