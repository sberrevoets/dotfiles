#!/bin/sh

if [[ $DOTFILES_PROFILE == "personal" ]];
then
    dockutil --no-restart --remove all
    dockutil --no-restart --add "/Applications/Safari.app"
    dockutil --no-restart --add "/Applications/Xcode.app"
    dockutil --no-restart --add "/System/Applications/Mail.app"
    dockutil --no-restart --add "/System/Applications/Messages.app"
    dockutil --no-restart --add "/System/Applications/Calendar.app"
    dockutil --no-restart --add "/Applications/Slack.app"
    dockutil --no-restart --add "/Applications/Ghostty.app"
    dockutil --no-restart --add "~/Downloads" --view fan
elif [[ $answer == "work" ]];
then
    dockutil --no-restart --remove all
    dockutil --no-restart --add "/Applications/Google Chrome.app"
    dockutil --no-restart --add "/Applications/Xcode.app"
    dockutil --no-restart --add "/Applications/Linear.app"
    dockutil --no-restart --add "/Applications/Notion.app"
    dockutil --no-restart --add "/Applications/Slack.app"
    dockutil --no-restart --add "/Applications/Ghostty.app"
    dockutil --no-restart --add "~/Downloads" --view fan
else
    echo "No DOTFILES_PROFILE set, skipping dock configuration."
fi

## System Preferences

# Icon "size"
defaults write com.apple.dock tilesize -int 60

# [ ] Magnification
defaults write com.apple.dock magnification -bool false

# Magnification:
defaults write com.apple.dock largesize -int 60

# Position on screen: Bottom
defaults write com.apple.dock orientation -string 'right'

# Minimize windows using: Genie effect
defaults write com.apple.dock mineffect -string 'genie'

# Prefer tabs when opening documents: Manually
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'manual'

# [x] Double-click a window's title bar to "zoom"
defaults write NSGlobalDomain AppleActionOnDoubleClick -string 'Maximize'

# [x] Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# [x] Animate opening applications
defaults write com.apple.dock launchanim -bool true

# [ ] Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# [x] Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# [ ] Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

## Custom

# Remove the auto show/hide trigger delay
defaults write com.apple.dock autohide-delay -float 0

# Reduce the auto show/hide animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.3

killall Dock
