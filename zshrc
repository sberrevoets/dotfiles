export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"

configs=($DOTFILES/*/*.bash $DOTFILES/*/*.zsh)

for config in "${configs[@]}"; do
    source "$config"
done
