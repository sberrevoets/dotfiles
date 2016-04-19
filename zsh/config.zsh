# Use vim in Terminal
bindkey -v

# Use Ctrl + R for history search
bindkey '^R' history-incremental-search-backward

# Load zsh hooks
autoload -U add-zsh-hook

# Advanced completions
autoload -U compinit && compinit

# Insert quotes around typed URLs
autoload -U url-quote-magic

# Complete commands starting with currently typed text
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search

# Try to cd into directory if command doesn't exist
setopt AUTO_CD

# Silence please
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Allow for editing of previous command when using !!
setopt HIST_VERIFY

# Move to end after completion
setopt ALWAYS_TO_END

# Create a directory and navigate to it
mkcd () { mkdir "$@" && cd "$@"; }

# List directory contents on cd
cd() { builtin cd "$@" && l; }
