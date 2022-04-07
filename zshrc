export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"

# Set homebrew prefix based on architecture for Apple Silicon support
if [[ $(arch) == arm64* ]]; then
  export BREW_PREFIX=/opt/homebrew
else
  export BREW_PREFIX=/usr/local
fi

configs=($DOTFILES/*/*.bash $DOTFILES/*/*.zsh $DOTFILES/*/*.sh))
for file in ${configs:#*/completions.zsh}
do
    source $file
done
