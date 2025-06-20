if command -v atuin &> /dev/null; then
  export ATUIN_CONFIG_DIR="$DOTFILES/atuin"
  eval "$(atuin init zsh)"

  export ATUIN_NOBIND="true"
  eval "$(atuin init zsh)"

  bindkey '^r' atuin-search

  # bind to the up key, which depends on terminal mode
  bindkey '^[[A' atuin-up-search
  bindkey '^[OA' atuin-up-search
fi

