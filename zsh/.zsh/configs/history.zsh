# ref 1. https://www.josean.com/posts/how-to-setup-alacritty-terminal
# ref 2. https://github.com/thoughtbot/dotfiles/blob/main/zsh/configs/history.zsh
# ref 3. https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc
HISTFILE=$HOME/.zhistory
SAVEHIST=4096
HISTSIZE=$SAVEHIST
HISTDUP=erase

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

