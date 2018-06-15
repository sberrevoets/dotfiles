#!/bin/bash

dir=$DOTFILES
files=(bashrc \
       bin \
       ctags \
       gitattributes \
       gitconfig \
       gitignore \
       js \
       lldbhelpers \
       lldbinit \
       tmux.conf \
       tmuxinator \
       urlview \
       vimrc \
       zshrc)

cd $dir
for file in "${files[@]}"; do
    ln -s $dir/$file ~/.$file
done
