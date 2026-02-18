#!/usr/bin/env bash

install_dir="~/.config/nvim"

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    vim +PlugInstall +qall

    mkdir -p "$install_dir"
    ln -s $DOTFILES/vim/init.lua ~/.config/nvim/init.lua

    if ! pyenv versions --bare | grep -q '^nvim-venv$'; then
        pyenv virtualenv nvim-venv
    fi
    ~/.pyenv/versions/nvim-venv/bin/pip install --upgrade pynvim
}

uninstall() {
    # TODO: vim-plug uninstall works by removing the plugins from vimrc and then
    # running :PlugClean. Extract the plugin list from vimrc to make this work.
    rm -rf "$install_dir"
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
