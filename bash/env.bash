# PATH:
#  - $HOME/.bin        (personalized)
#  - $BREW_PREFIX/bin  (Homebrew Apple Silicon)
#  - /bin
#  - /usr/sbin
#  - /sbin
#  - /usr/local/bin    (Homebrew Intel)
#  - /usr/bin          (system executables)
export PATH="$HOME/.bin:$BREW_PREFIX/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin"
export EDITOR="$(which nvim)"
export CDPATH=".:$HOME/Developer"
