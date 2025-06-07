#!/bin/bash

# $DOTFILES might not be set yet as we're in the middle of the installation process.
if [ -z "$DOTFILES" ]; then
    export DOTFILES="$(dirname $(readlink -f $0))"
fi

# Change default shell to zsh
chsh -s $(which zsh)

# Create base installation
./install.sh install

# Configure ghostty
mkdir -p ~/.config/ghostty
ln -s $DOTFILES/ghostty  ~/.config/ghostty/config

# Install macOS preferences
if [ "$(uname)" == "Darwin" ]; then
    echo "macOS (Darwin) detected; sourcing macOS preferences"
    ./macOS/install.sh
fi

# Install vim plugins and configurations
./vim/install.sh

# Install node
./nvm/install.sh
