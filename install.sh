#!/bin/bash

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
       vim \
       vimrc \
       zshrc)

install_location() {
    echo "$HOME/.$1"
}

die() {
    echo "Usage: ./install.sh {install|uninstall}"
    exit 1
}

install() {
    for file in "${files[@]}"; do
        target=$(install_location $file)
        ln -s $PWD/$file $target
        echo "Installed $target"
    done
}

uninstall() {
    for file in "${files[@]}"; do
        target=$(install_location $file)
	rm $target
        echo "Uninstalled $target"
    done
}

if [[ $# != 1 ]]; then
    die
fi

if [[ $1 == "install" ]]; then
    install
elif [[ $1 == "uninstall" ]]; then
    uninstall
else
    die
fi
