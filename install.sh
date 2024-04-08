#!/usr/bin/env bash

stow -v bash -t ~
stow -v neovim -t ~
stow -v gnupg -t ~
stow -v jq -t ~
stow -v skhd -t ~
stow -v starship -t ~
stow -v yabai -t ~
stow -v alacritty -t ~
stow -v spacebar -t ~
stow -v luaformatter -t ~

stow -v git -t ~

# vscode settings
stow -v vscode -t ~/Library/Application\ Support/Code/User/ --adopt

# install scripts
stow -v -S scripts -t /usr/local/bin
