# PATH:
#  - $HOME/.bin        (personalized)
#  - /opt/homebrew/bin  (Homebrew Apple Silicon)
#  - /bin
#  - /usr/sbin
#  - /sbin
#  - /usr/local/bin    (Homebrew Intel)
#  - /usr/bin          (system executables)

# TODO: Look into moving zshenv
export PATH="$HOME/.bin:/opt/homebrew/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin"
export EDITOR="$(which nvim)"
export CDPATH=".:$HOME/Developer"

export GIT_PILE_USE_PR_TEMPLATE="true"
