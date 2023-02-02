#!/bin/bash

files=(bashrc \
       bin \
       ctags \
       gitattributes \
       gitconfig \
       gitignore \
       ledgerrc \
       lldbhelpers \
       lldbinit \
       tmux.conf \
       urlview \
       vim \
       vimrc \
       zshenv \
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
        if [ ! -f "$target" -a ! -d "$target" ]; then
            ln -s $PWD/$file $target && echo "Installed $target"
        else
            echo "$target exists; skipping"
        fi
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
