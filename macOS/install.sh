#!/usr/bin/env bash

if [ ! -f "$HOME/.netrc" ]; then
    echo "Enter GitHub Personal Access Token (PAT) to enable dotfiles installation:"
    read -r github_pat

    echo "machine github.com" >> "$HOME/.netrc"
    echo "    login sberrevoets" >> "$HOME/.netrc"
    echo "    password $github_pat" >> "$HOME/.netrc"
    chmod 600 "$HOME/.netrc"
fi

if ! which brew &> /dev/null; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew bundle --file=$DOTFILES/macOS/Brewfile

# Install Mac App Store apps
$DOTFILES/macOS/mas.sh

# Create personalized system and app defaults
$DOTFILES/macOS/general.sh
$DOTFILES/macOS/keyboard.sh
$DOTFILES/macOS/defaults.sh
$DOTFILES/macOS/sound.sh
$DOTFILES/macOS/trackpad.sh
$DOTFILES/macOS/xcode.sh
$DOTFILES/macOS/dock.sh

# Update Xcode theme
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp "$DOTFILES/macOS/Monokai Inconsolata.dvtcolortheme" ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
