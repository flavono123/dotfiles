# Aliases
alias nv 'nvim'
alias dot '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias r 'bundle exec rails'
alias rk 'bundle exec rake'
alias t 'rk test'

# Fish (Space Fish)
set SPACEFISH_PROMPT_ADD_NEWLINE false

# Ruby on Rails
set -gx PATH ~/.rbenv/shims $PATH
set -gx RAILS_ENV development

set -gx PATH $PATH ~/.scripts
