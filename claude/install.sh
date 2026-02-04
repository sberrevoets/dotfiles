#!/usr/bin/env bash

source_dir="$DOTFILES/claude"
install_dir="$HOME/.claude"

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    mkdir -p "$install_dir"

    for file in "$source_dir"/*; do
        if [ "$(basename "$file")" = "install.sh" ]; then
            continue
        fi

        filename=$(basename "$file")
        target="$install_dir/$filename"

        if [ ! -e "$target" ]; then
            ln -s "$file" "$target" && echo "Installed $target"
        else
            echo "$target exists; skipping"
        fi
    done
}

uninstall() {
    for file in "$source_dir"/*; do
        if [ "$(basename "$file")" = "install.sh" ]; then
            continue
        fi

        filename=$(basename "$file")
        target="$install_dir/$filename"

        if [ -e "$target" ]; then
            rm -f "$target"
            echo "Uninstalled $target"
        fi
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
