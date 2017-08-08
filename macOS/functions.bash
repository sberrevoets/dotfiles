# macOS specific `l`
l() {
    if ls --color > /dev/null 2>&1; then
        ls -lFg --color # GNU
    else
        ls -lFhG # Default macOS
    fi
}

# Gemfile-aware `pod install`
pi() {
  if [ -e "Gemfile" ]; then
    bundle exec pod install || bundle exec pod install --repo-update
  else
    pod install || pod install --repo-update
  fi
}
