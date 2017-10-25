#!/bin/bash
######################
# Creates symlinks from the home directory to the specified files
######################

dir=$DOTFILES
files=(bashrc \
       bin \
       ctags \
       gitattributes \
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
