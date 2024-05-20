zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --all --tree --color=always $realpath'
zstyle ':fzf-tab:complete:mv:*' fzf-preview 'eza --all --tree --color=always $realpath'

autoload -Uz compinit
compinit -i
