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

PROMPT_SYMBOL='❯'

function get_pwd() {
    echo -n "%{$fg_bold[blue]%}%c"
}

function current_branch_or_commit() {
    local branch="${$(git symbolic-ref -q HEAD 2> /dev/null)##refs/heads/}"
    local commit="$(git rev-parse --short HEAD 2> /dev/null)"
    echo "${branch:-$commit}"
}

function prompt_host() {
    if [[ -n $SSH_CONNECTION ]]; then
        me="%n@%m"
    elif [[ $LOGNAME != $USER ]]; then
        me="%n"
    fi

    if [[ -n $me ]]; then
        echo "%{$fg[green]%}$me%{$reset_color%}:"
    fi
}

function prompt_git_status() {
    local message=""
    local message_color="%{$fg_bold[green]%}"

    local staged=$(git status --porcelain 2>/dev/null | grep -e "^M " -e "^A ")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^ M" -e "^??")

    if [[ -n ${staged} ]]; then
        message_color="%{$fg_bold[red]%}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%{$fg_bold[yellow]%}"
    fi

    local git_ref=$(current_branch_or_commit)
    if [[ -n ${git_ref} ]]; then
        message+="${message_color}${git_ref}%f"
    fi

    echo -n "${message}"
}

function set_prompt_legacy() {
    if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
        local git_dirty=" %{$fg[red]%}✗"
    fi

    if [ -n "$(git rev-parse --git-dir 2> /dev/null)" ]; then
        local git_info=" %{$fg_bold[blue]%}($(current_branch_or_commit)$git_dirty%{$fg_bold[blue]%})"
    fi

    PROMPT="%{$fg_bold[magenta]%}[%*]%{$fg_bold[green]%} $(get_pwd)$git_info%{$reset_color%} "
}

function return_status() {
    echo -n "%(?.%F{magenta}.%F{red})$PROMPT_SYMBOL%f "
}

function set_left_prompt() {
    PROMPT="$(prompt_host)$(get_pwd) $(return_status)%{$reset_color%}"
}

function set_right_prompt() {
    RPROMPT=""

    if [[ -f "/tmp/prompt_$$" ]]; then
        RPROMPT="$(cat /tmp/prompt_$$)"
    fi
}


ASYNC_PROC=0
function set_prompt() {
    set_left_prompt
    set_right_prompt

    function async() {
        printf "%s" "$(prompt_git_status)%{$reset_color%}" > "/tmp/prompt_$$"
        kill -s USR1 $$
    }

    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi

    async &!
    ASYNC_PROC=$!
}

function TRAPUSR1() {
    set_right_prompt
    ASYNC_PROC=0
    zle && zle reset-prompt
 }

add-zsh-hook precmd set_prompt
