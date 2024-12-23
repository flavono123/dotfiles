for config_file ($HOME/.zsh/configs/*.zsh); do
  . $config_file
done

if [ -f "$HOME/.aliases" ]; then
  . "$HOME/.aliases"
fi

if [ -f "$HOME/.zshrc.local" ]; then
  . "$HOME/.zshrc.local"
fi

# The next line updates PATH for CLI.
if [ -f '/Users/hansuk.hong/yandex-cloud/path.bash.inc' ]; then source '/Users/hansuk.hong/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/hansuk.hong/yandex-cloud/completion.zsh.inc' ]; then source '/Users/hansuk.hong/yandex-cloud/completion.zsh.inc'; fi

