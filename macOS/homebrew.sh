#!/usr/bin/env bash

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    if ! which brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew update
    brew bundle --file=$DOTFILES/macOS/Brewfile

    if [ "$DOTFILES_PROFILE" = "work" ]; then
        brew bundle --file=$DOTFILES/macOS/Brewfile.speak
    fi
}

uninstall() {
    if which brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    fi

    rm -rf /opt/homebrew
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
