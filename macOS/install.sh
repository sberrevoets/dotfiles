#!/usr/bin/env bash

cp ../netrc "$HOME/.netrc"
chmod 0600 "$HOME/.netrc"
read -p "Created .netrc; add GitHub PAT now or further installation will fail"

if ! which brew &> /dev/null; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew bundle --file=$DOTFILES/macOS/Brewfile
brew bundle --file=$DOTFILES/macOS/Caskfile

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


# Set up Terminal theme
# Make sure this user owns the plist, without it the theme reverts back every time
sudo chown "$USER":staff ~/Library/Preferences/com.apple.Terminal.plist
echo "Import Terminal theme from Preferences > Profiles and set as default"
read -p "Press return to continue"
