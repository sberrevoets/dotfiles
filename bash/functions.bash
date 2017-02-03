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

# Generate .gitignore based on parameters
function gitignore() {
    curl -L -s https://www.gitignore.io/api/"$@" > .gitignore;
}

function json() {
    if [ -t 0 ]; then
        # JSON as argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else
        # JSON from pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}
