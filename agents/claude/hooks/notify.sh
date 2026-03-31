#!/usr/bin/env bash

set -eu

[ -n "${TMUX_PANE:-}" ] || exit 0

pane_info="$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty} #{session_attached} #{window_active} #{pane_active}' 2>/dev/null)" || exit 0
set -- $pane_info

target_tty="$1"
session_attached="$2"
window_active="$3"
pane_active="$4"

[ -w "$target_tty" ] || exit 0

if [ "$session_attached" = "1" ] && [ "$window_active" = "1" ] && [ "$pane_active" = "1" ]; then
    exit 0
fi

printf '\a' >"$target_tty"
