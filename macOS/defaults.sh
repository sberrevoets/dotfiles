## macOS

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Increase tracking speed on trackpad
defaults write "Apple Global Domain" com.apple.trackpad.scaling -int 2

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# TODO: figure out if there is a way to make these work
# The defaults are correct but the functionality doesn't work

# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
#
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
#
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
#
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
#
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
#
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

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

# Use home folder as default in Finder
defaults write com.apple.finder NewWindowTarget -string "PfHm";
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/$USER"

# Unhide ~/Library
chflags nohidden ~/Library

# Don't open Photos when a new device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Close printer window when print task finishes
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable ⌘ + Q for Finder
defaults write com.apple.finder QuitMenuItem -bool true

# For com.apple.universalaccess to be able to be written to, enable Full Disk Access
# in Settings > Privacy > Full Disk Access.
# TODO: see if this can be set automatically?

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

### iTunes

# Disable device update alerts
defaults write com.apple.iTunes disableCheckForDeviceUpdates -bool YES

### Mail

# Use ⌘ + Enter to send an email
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

### Calendar/iCal

# Don't add invites to Notification Center
defaults write com.apple.iCal InvitationNotificationsDisabled -int 1

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -int 1

# Hide weekend days from week view
defaults write com.apple.iCal "n days of week" -int 5
