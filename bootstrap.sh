#!/bin/bash

if [[ $ZSH_EVAL_CONTEXT != *:file ]]; then
    echo "Source this file instead of executing it directly"
    exit 1
fi

echo "Ensure Terminal has access in System Preferences > Privacy & Security > Full Disk Access & Developer Tools."
while true; do
    echo "[O]pen Preferences, [C]ontinue, or [Q]uit? "
    read -r choice
    case "$choice" in
    [Oo]*) open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles" ;;
    [Cc]*) break ;;
    [Qq]*)
        echo "Exiting..."
        return 0
        ;;
    *) echo "Please answer O, C, or Q." ;;
    esac
done

echo "Use a [P]ersonal or [W]ork configuration? "
read -r config_choice
case "$config_choice" in
[Pp]*) export DOTFILES_PROFILE="personal" ;;
[Ww]*) export DOTFILES_PROFILE="work" ;;
esac

sudo -v

# Check if zsh is available, exit with an error message if not
# TODO: make this nicer and more compatible when zsh is not installed
if ! command -v zsh &>/dev/null; then
    echo "zsh is required but not installed"
    exit 1
fi

# $DOTFILES might not be set yet as we're in the middle of the installation process
if [ -z "$DOTFILES" ]; then
    export DOTFILES="$(dirname $(readlink -f $0))"
fi

function set_zsh_shell() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Changing default shell to $(which zsh)"
        chsh -s $(which zsh)
    fi
}

set_zsh_shell

# Create base installation
./install.sh install
source "$DOTFILES/zshrc"

# Configure ghostty
mkdir -p ~/.config/ghostty
ln -s $DOTFILES/ghostty ~/.config/ghostty/config

# Install macOS preferences
if [ "$(uname)" = "Darwin" ]; then
    ./macOS/install.sh install

    # Set zsh shell to brew-installed zsh
    set_zsh_shell
fi

# Install pyenv-managed Python
./python/install.sh install

# Install vim plugins and configurations
./vim/install.sh install

# Install node
./nvm/install.sh install

# Install Claude Code + Codex CLI
./agents/install.sh install
