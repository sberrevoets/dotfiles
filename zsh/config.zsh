# Use vim in Terminal
bindkey -v

# Use Ctrl + R for history search
bindkey '^R' history-incremental-search-backward

autoload -U add-zsh-hook

# Complete commands starting with currently typed text
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search

setopt AUTO_CD
