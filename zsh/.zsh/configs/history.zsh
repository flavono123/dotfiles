# ref 1. https://www.josean.com/posts/how-to-setup-alacritty-terminal
# ref 2. https://github.com/thoughtbot/dotfiles/blob/main/zsh/configs/history.zsh
HISTFILE=$HOME/.zhistory
SAVEHIST=4096
HISTSIZE=4096

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
