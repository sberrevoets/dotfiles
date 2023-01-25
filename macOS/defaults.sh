## macOS

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

### Tweetbot

# No t.co
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true
