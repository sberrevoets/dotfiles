export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"

configs=($DOTFILES/*/*.bash $DOTFILES/*/*.zsh)
for file in ${configs:#*/completions.zsh}
do
    source $file
done

