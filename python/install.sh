#!/bin/bash

pyenv_python_version="3.13"

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    pyenv install "$pyenv_python_version"
    pyenv global "$pyenv_python_version"
    pyenv rehash
}

uninstall() {
    for version in $(pyenv versions --bare); do
        pyenv uninstall -f "$version"
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
