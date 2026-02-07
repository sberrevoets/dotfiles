# More informative ls
function l() {
    if command -v eza &> /dev/null; then
        eza -la --git --icons --group-directories-first
    else
        ls -lFh --color
    fi
}

# Create a directory and navigate to it
function mkcd () {
    mkdir "$@" && cd "$@";
}

# Change working directory to the top-most Finder window location
function cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Colored man pages
man() {
    LESS_TERMCAP_md=$(tput bold; tput setaf 4)            \
    LESS_TERMCAP_me=$(tput sgr0)                           \
    LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 3) \
    LESS_TERMCAP_ue=$(tput sgr0)                           \
    command man "$@" || "$@" -h;
}

# Generate .gitignore based on parameters
function gitignore() {
    curl -L -s https://www.gitignore.io/api/"$@" > .gitignore;
}

# Convenience function for pretty printing JSON
function json() {
    if [ -t 0 ]; then
        # JSON as argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else
        # JSON from pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}

# Make `tre` more convenient
function tree() {
    command tre "$@" -e
    source "/tmp/tre_aliases_$USER" 2>/dev/null;
}
