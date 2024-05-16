zsh_as_file="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [[ -f "$zsh_as_file" ]]; then
  . "$zsh_as_file"
fi

