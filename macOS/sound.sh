### System Preferences > Sound

#### Sound Effects

# [x] Play user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool true

# [ ] Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false
