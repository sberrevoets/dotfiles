# macOS specific `l`
l() {
    if ls --color > /dev/null 2>&1; then
        ls -lFhg --color # GNU
    else
        ls -lFhG # Default macOS
    fi
}
