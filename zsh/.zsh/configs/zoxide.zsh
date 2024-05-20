if ! command -v zoxide > /dev/null; then
  echo "${(%):-%N}: 'zoxide' could not be found"
else
  eval "$(zoxide init --cmd cd zsh)"
fi

