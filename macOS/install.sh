#!/usr/bin/env bash

if ! which brew &> /dev/null; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew bundle --file=Brewfile
brew bundle --file=Caskfile

# Create personalized system and app defaults
source defaults.sh

# Build the Dock
sh dock.sh

# Update Xcode theme
cp "Monokai Inconsolata.dvtcolortheme" ~/Library/Developer/Xcode/UserData/FontAndColorThemes/

echo "Import Terminal.terminal manually through Preferences > Gear > Import."
read -p "Press return to continue"
