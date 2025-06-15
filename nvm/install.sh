#!/usr/bin/env bash

die() {
    echo "Usage: ./install.sh {install|uninstall}"
    exit 1
}

install() {
    export PROFILE=/dev/null
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

    source "$DOTFILES/nvm/config.zsh"

    nvm install node
    nvm use node

    npm install -g typescript
    npm install -g typescript-language-server # tsserver integration in neovim
    npm install -g vscode-langservers-extracted # eslint in neovim
    npm install -g pyright # Python LSP integration
    npm install -g bash-language-server # Bash LSP integration
    npm install -g pdiffjson # Diff JSON with sorting options
    npm install -g eslint # ESLint
}

uninstall() {
    if [[ -n "$NVM_DIR" ]]; then
        echo "Remove $NVM_DIR? [Y/n]"
        read -r answer
        if [[ $answer == "Y" || $answer == "y" || $answer == "" ]]; then
            rm -rf "$NVM_DIR"
        fi
    fi
}

if [[ $# != 1 ]]; then
    die
fi

if [[ $1 == "install" ]]; then
    install
elif [[ $1 == "uninstall" ]]; then
    uninstall
else
    die
fi

