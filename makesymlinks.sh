#!/bin/bash
######################
# makesymlinks.sh
# This script creates symlinks from the home directory to all files from ~/dotfiles
######################

dir=~/dotfiles
files="bashrc fzf lldbinit oh-my-zsh zshrc gitconfig vimrc"

####
cd $dir

for file in $files; do
    ln -s $dir/$file ~/.$file
done

