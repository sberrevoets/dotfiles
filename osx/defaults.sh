### OS X

# Enable dark UI
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set sidebar icons to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable swipe action for notification center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

# Set dock icon size
defaults write com.apple.dock tilesize -int 50

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Show status bar and path bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable warning when emptying trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Unhide ~/Library
chflags nohidden ~/Library

# Don't open Photos when a new device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Close printer window when print task finishes
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable ⌘ + Q for Finder
defaults write com.apple.finder QuitMenuItem -bool true

### iTunes

# Disable device update alerts
defaults write com.apple.iTunes disableCheckForDeviceUpdates -bool YES

### Mail

# Use ⌘ + Enter to send an email
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

### Xcode

# Trim trailing whitespace
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true

# Trim whitespace-only lines
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true

# Show line numbers
defaults write com.apple.dt.Xcode DVTTextEditorShowLineNumbers -bool true

# Enable internal debug menu
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true

# Open quickly opens in the focused pane
defaults write com.apple.dt.Xcode IDEEditorCoordinatorTarget_Click -string "FocusedEditor"

# Show build time in toolbar
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES

# Disable state restoration (for storyboards mostly)
defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool true

### Tweetbot

# No t.co
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true
