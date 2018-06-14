#!/bin/bash

# Change default shell to zsh
chsh -s $(which zsh)

# Create base installation
./install.sh install

# Install vim plugins and configurations
./vim/install.sh
