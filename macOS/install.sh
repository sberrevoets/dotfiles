#!/usr/bin/env bash

touch "$HOME/.netrc"
chmod 0600 "$HOME/.netrc"
read -p "Created .netrc; add credentials now or further installation will fail"

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
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp "Monokai Inconsolata.dvtcolortheme" ~/Library/Developer/Xcode/UserData/FontAndColorThemes/


# Set up Terminal theme
# Make sure this user owns the plist, without it the theme reverts back every time
sudo chown "$USER":staff ~/Library/Preferences/com.apple.Terminal.plist
echo "Import Terminal theme from Preferences > Profiles and set as default"
read -p "Press return to continue"
