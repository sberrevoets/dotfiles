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

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Try to cd into directory if command doesn't exist
setopt AUTO_CD

# Show directory contents when cd'ing
chpwd_functions=($chpwd_functions l)

# Silence please
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Allow for editing of previous command when using !!
setopt HIST_VERIFY

# Move to end after completion
setopt ALWAYS_TO_END

## History settings
# Save x items to the given history file
HISTSIZE=1000000000000000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

# Append history to the zsh_history file
setopt APPEND_HISTORY

# Write to history after each command
setopt INC_APPEND_HISTORY

# Don't store the history command
setopt HIST_NO_STORE

# Ignore duplicates in zsh history
setopt HIST_IGNORE_ALL_DUPS

# Ignore commands for history that start with a space
setopt HIST_IGNORE_SPACE

# Remove superfluous blanks from each line being added to the history list
setopt HIST_REDUCE_BLANKS

# After !! previous command don't execute, allow editing
setopt HIST_VERIFY

