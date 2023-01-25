export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export ALLOW_UNSUPPORTED_XCODE=1
export HOMEBREW_NO_ANALYTICS=1
export NO_SWIFTLINT=1
export COCOAPODS_DISABLE_STATS=1

# https://github.com/Homebrew/homebrew-core/issues/15746
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
