RBENVPATH="$HOME/.rbenv"

PATH="$RBENVPATH/bin:$PATH"

if command rbenv &> /dev/null; then
    eval "$(rbenv init - --no-rehash)"
fi

