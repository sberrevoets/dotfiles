# PATH:
#  - $HOME/.bin        (personalized)
#  - $HOME/.local/bin  (personalized, certain tools install here)
#  - /opt/homebrew/bin  (Homebrew Apple Silicon)
#  - /bin
#  - /usr/sbin
#  - /sbin
#  - /usr/local/bin    (Homebrew Intel)
#  - /usr/bin          (system executables)

# TODO: Look into moving zshenv
export PATH="$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin"
export EDITOR="$(which nvim)"
export CDPATH=".:$HOME/Developer"

export GIT_PILE_USE_PR_TEMPLATE="true"
