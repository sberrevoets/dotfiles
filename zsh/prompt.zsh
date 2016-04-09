autoload -U colors && colors

# Colors:
# 0 - black
# 1 - red
# 2 - green
# 3 - yellow
# 4 - blue
# 5 - magenta
# 6 - cyan
# 7 - white

function get_pwd() {
    echo "$(basename ${PWD/$HOME/~})"
}

function current_branch_or_commit() {
    local branch="${$(git symbolic-ref -q HEAD 2> /dev/null)##refs/heads/}"
    local commit="$(git rev-parse --short HEAD 2> /dev/null)"
    echo "${branch:-$commit}"
}

function set_prompt() {
    if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
        local git_dirty=" %{$fg[red]%}✗"
    fi

    if [ -n "$(git rev-parse --git-dir 2> /dev/null)" ]; then
        local git_info=" %{$fg_bold[blue]%}($(current_branch_or_commit)$git_dirty%{$fg_bold[blue]%})"
    fi

    PROMPT="%{$fg_bold[magenta]%}[%*]%{$fg_bold[green]%} $(get_pwd)$git_info%{$reset_color%} "
}

add-zsh-hook precmd set_prompt
