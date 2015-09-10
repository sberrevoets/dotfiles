# CocoaPods
alias pi='pod install'

# Xcode Derived Data
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData/'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool TRUE; killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

