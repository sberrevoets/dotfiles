### OS X ###

# Enable dark UI
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set sidebar icons to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable swipe action for notification center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

### Xcode ###

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

