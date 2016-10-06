__fsel() {
  command find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3- | pick | while read item; do
    printf '%q ' "$item"
  done
  echo
}

fuzzy-git-branch-widget() {
  trap "" INT

  result="$(git branch | cut -c 3- | pick)"
  if [[ "$result" != "" ]]; then
    LBUFFER="${LBUFFER}\"$result\""
    zle redisplay
    zle accept-line
  fi

  trap INT
}

fuzzy-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  zle redisplay
  zle accept-line
}

zle     -N   fuzzy-git-branch-widget
bindkey '^B' fuzzy-git-branch-widget

zle     -N   fuzzy-file-widget
bindkey '^F' fuzzy-file-widget
