# macOS specific `l`
l() {
    if command -v eza &> /dev/null; then
        eza -l --icons --group-directories-first
    elif ls --color > /dev/null 2>&1; then
        ls -lFhg --color # GNU
    else
        ls -lFhG # Default macOS
    fi
}
