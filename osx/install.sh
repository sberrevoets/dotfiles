#!/usr/bin/env bash
# Bootstrap OS X configuration

if ! which brew &> /dev/null; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/brewdler
brew update
brew bundle --file=Brewfile
brew bundle --file=Caskfile
