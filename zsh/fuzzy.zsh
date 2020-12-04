find_files() {
    command find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | sed 1d | cut -b3- | fzy | while read item; do
            printf '%q ' "$item"
    done
    echo
}

trim_quotes() {
    echo "$1" | sed -e 's/"$//' -e 's/^"//'
}

fuzzy-git-branch-widget() {
    trap "" INT

    result="$(git branch | cut -c 3- | fzy)"
    if [[ "$result" != "" ]]; then
        LBUFFER="${LBUFFER}\"$result\""
        zle redisplay
        zle accept-line
    fi

    trap INT
}

fuzzy-git-file-widget() {
    trap "" INT

    if [[ -d .git ]]; then
        files="$(git ls-files "$(git rev-parse --show-toplevel 2>/dev/null)" \
            --cached --exclude-standard --others 2>/dev/null | fzy)"
    else
        files=$(find_files)
    fi

    LBUFFER="${LBUFFER}\"$(trim_quotes $files)\""
    zle redisplay
    zle accept-line
}

fuzzy-file-widget() {
    LBUFFER="${LBUFFER}$(find_files)"
    zle redisplay
    zle accept-line
}

zle     -N   fuzzy-git-branch-widget
bindkey '^B' fuzzy-git-branch-widget

zle     -N   fuzzy-git-file-widget
bindkey '^F' fuzzy-git-file-widget

zle     -N   fuzzy-file-widget
bindkey '^A' fuzzy-file-widget
