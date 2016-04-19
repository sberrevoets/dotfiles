precmd() {
  [ -n "$TMUX" ] && tmux set-window-option -qg window-status-current-format "${PWD##/*/}"
}
