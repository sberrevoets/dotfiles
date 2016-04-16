#!/bin/bash
######################
# Creates symlinks from the home directory to the specified files
######################

dir=~/dotfiles
files=(bashrc \
       gitconfig \
       gitignore \
       js \
       tmux.conf \
       tmuxinator \
       urlview \
       vimrc \
       xvimrc \
       zshrc)

cd $dir
for file in $files; do
    ln -s $dir/$file ~/.$file
done

