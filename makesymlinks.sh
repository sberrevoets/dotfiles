#!/bin/bash
######################
# makesymlinks.sh
# This script creates symlinks from the home directory to all files from ~/dotfiles
######################

dir=~/dotfiles
files="bashrc fzf lldb oh-my-zsh zshrc gitconfig"

####
cd $dir

for file in $files; do
    ln -s $dir/$file ~/.$file
done

