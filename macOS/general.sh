### System Preferences > General

# Appearance: Dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Accent color: Blue
defaults write NSGlobalDomain AppleAquaColorVariant -int 1

# Highlight color: "Blue"
defaults write NSGlobalDomain AppleHighlightColor -string '0.780400 0.815700 0.858800'

# Automatically hide and show the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# Sidebar icon size: Medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Show scroll bars: "When scrolling"
defaults write NSGlobalDomain AppleShowScrollBars -string WhenScrolling

# Click in the scroll bar to "Jump to the spot that's clicked"
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# Default web browser: Safari
# TODO

# Ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool false

# [x] Use LCD font smoothing when available
# TODO
