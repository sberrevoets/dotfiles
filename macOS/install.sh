#!/usr/bin/env bash

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    if [ ! -f "$HOME/.netrc" ]; then
        echo "Enter GitHub Personal Access Token (PAT) to enable dotfiles installation:"
        read -r github_pat

        echo "machine github.com" >> "$HOME/.netrc"
        echo "    login sberrevoets" >> "$HOME/.netrc"
        echo "    password $github_pat" >> "$HOME/.netrc"
        chmod 600 "$HOME/.netrc"
    fi

    $DOTFILES/macOS/homebrew.sh install
    $DOTFILES/macOS/mas.sh install

    # Create personalized system and app defaults
    $DOTFILES/macOS/general.sh
    $DOTFILES/macOS/keyboard.sh
    $DOTFILES/macOS/defaults.sh
    $DOTFILES/macOS/sound.sh
    $DOTFILES/macOS/trackpad.sh
    $DOTFILES/macOS/xcode.sh
    $DOTFILES/macOS/dock.sh
}

uninstall() {
    echo "Remove ~/.netrc? [y/N]"
    read -r remove

    if [[ $remove == "y" || $remove == "Y" ]]; then
        mv "$HOME/.netrc" "$HOME/.netrc.bak"
    fi

    $DOTFILES/macOS/homebrew.sh uninstall
    $DOTFILES/macOS/mas.sh uninstall
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
