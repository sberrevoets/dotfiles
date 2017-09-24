export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://github.com/Homebrew/homebrew-core/issues/15746
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Open quickly
alias o='open'
alias oo='open .'

# Open Xcode workspace/project easily
alias x='open -a Xcode .'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool TRUE; killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
