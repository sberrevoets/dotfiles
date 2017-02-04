#!/usr/bin/env bash
# Bootstrap macOS configuration

if ! which brew &> /dev/null; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew bundle --file=Brewfile
brew bundle --file=Caskfile

# Create personalized system and app defaults
source defaults.sh
