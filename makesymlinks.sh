#!/bin/bash
######################
# Creates symlinks from the home directory to the specified files
######################

dir=~/dotfiles
files="bashrc fzf gitconfig js lldbinit oh-my-zsh tmuxinator vimrc zshrc"

####
cd $dir

for file in $files; do
    ln -s $dir/$file ~/.$file
done

