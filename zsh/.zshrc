for config_file ($HOME/.zsh/configs/*.zsh); do
  . $config_file
done

if [ -f "$HOME/.aliases" ]; then
  . "$HOME/.aliases"
fi

if [ -f "$HOME/.zshrc.local" ]; then
  . "$HOME/.zshrc.local"
fi
