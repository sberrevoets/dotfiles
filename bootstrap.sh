#!/bin/bash

# Change default shell to zsh
chsh -s $(which zsh)

# Create necessary symlinks
./makesymlinks.sh
