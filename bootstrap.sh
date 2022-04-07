#!/bin/bash

# Change default shell to zsh
chsh -s $(which zsh)

# Create base installation
./install.sh install

# Install macOS preferences
if [ "$(uname)" == "Darwin" ]; then
    echo "macOS (Darwin) detected; sourcing macOS preferences"
    ./macOS/install.sh
fi

# Install vim plugins and configurations
./vim/install.sh

# Install node
./nvm/install.sh
