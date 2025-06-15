export PROFILE=/dev/null
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

source "$DOTFILES/nvm/config.zsh"

nvm install node

npm install -g typescript
npm install -g typescript-language-server # tsserver integration in neovim
npm install -g vscode-langservers-extracted # eslint in neovim
npm install -g pyright # Python LSP integration
npm install -g bash-language-server # Bash LSP integration
npm install -g pdiffjson # Diff JSON with sorting options
npm install -g eslint # ESLint
