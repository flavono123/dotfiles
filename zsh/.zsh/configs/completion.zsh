zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --all --tree --color=always $realpath'
zstyle ':fzf-tab:complete:mv:*' fzf-preview 'eza --all --tree --color=always $realpath'

autoload -Uz compinit
compinit -i

# aws
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws

# kubectl
source <(kubectl completion zsh)

# dyff
source <(dyff completion zsh)
