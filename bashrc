export DOTFILES="$(dirname $(readlink $HOME/.bashrc))"

configs=($DOTFILES/*/*.bash $DOTFILES/*/*.sh)
for file in ${configs[@]}
do
  source $file
done
