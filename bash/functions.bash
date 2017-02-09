# More informative ls
function l() {
    ls -lFh --color
}

# Create a directory and navigate to it
function mkcd () { 
    mkdir "$@" && cd "$@"; 
}

# List directory contents on cd
function cd() {
    builtin cd "$@" && l; 
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
    command man "$@"
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

# Quick find
function f() {
    find . -name "$@"
}
