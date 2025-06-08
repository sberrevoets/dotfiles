export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"
export BREW_PREFIX=/opt/homebrew

configs=($DOTFILES/*/*.bash $DOTFILES/*/*.zsh)
for file in ${configs:#*/completions.zsh}
do
    source "$file"
done
