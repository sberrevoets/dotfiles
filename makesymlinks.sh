#!/bin/bash
######################
# Creates symlinks from the home directory to the specified files
######################

dir=~/dotfiles
files="bashrc fzf lldbinit oh-my-zsh zshrc gitconfig vimrc"

####
cd $dir

for file in $files; do
    ln -s $dir/$file ~/.$file
done

