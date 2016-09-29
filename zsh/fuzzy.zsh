__fsel() {
  command find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3- | $(__fuzzycmd) | while read item; do
    printf '%q ' "$item"
  done
  echo
}

__fuzzycmd() {
  echo "pick"
}

fuzzy-git-branch-widget() {
  trap "" INT

  result="$(git checkout $(git branch | cut -c 3- | $(__fuzzycmd)))"
  if [[ "$result" != "" ]]; then
    LBUFFER="${LBUFFER}\"$result\""
    zle redisplay
  fi

  trap INT
}

fuzzy-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  zle redisplay
}

zle     -N   fuzzy-git-branch-widget
bindkey '^B' fuzzy-git-branch-widget
alias b=fuzzy-git-branch-widget

zle     -N   fuzzy-file-widget
bindkey '^F' fuzzy-file-widget
