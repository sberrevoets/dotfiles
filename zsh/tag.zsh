if (( $+commands[tag] )); then
  tag() { command tag "$@" && source "/tmp/tag_aliases_$USER" 2>/dev/null }
  alias ag="tag ag"
fi
