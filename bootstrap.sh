#!/bin/bash

# $DOTFILES might not be set yet as we're in the middle of the installation process
if [ -z "$DOTFILES" ]; then
    export DOTFILES="$(dirname $(readlink -f $0))"
fi

# Change default shell to zsh
# This will set the shell to the system-wide zsh binary
# It's set again later in case a newer version of zsh was installed
echo "Changing default shell to $(which zsh)"
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

    # Change default shell to zsh again, in case a newer version was installed
    echo "Changing default shell to $(which zsh)"
    chsh -s $(which zsh)
fi

# Install vim plugins and configurations
./vim/install.sh

# Install node
./nvm/install.sh
