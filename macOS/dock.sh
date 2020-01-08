#!/bin/sh

if [[ -f ".dock" && $1 != '--force' ]];
then
    echo "Dock already created; use --force to override"
    exit 1
fi

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Music.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "~/Downloads" --view fan

defaults write com.apple.dock tilesize -int 50

killall Dock

touch .dock
echo "Updated Dock"
