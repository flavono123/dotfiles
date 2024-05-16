if ! command -v zoxide > /dev/null; then
  echo "${(%):-%N}: 'zoxide' could not be found"
else
  # ref. https://github.com/ajeetdsouza/zoxide/issues/336#issuecomment-1011925672
  autoload -Uz compinit
  compinit -i
  eval "$(zoxide init --cmd cd zsh)"
fi

