#!/bin/bash

echo "Installing vim plugins"
vim +PlugInstall +qall

echo "Creating backup dir"
mkdir backupdir -p

cp nvim.conf ~/.config/nvim/init.vim
