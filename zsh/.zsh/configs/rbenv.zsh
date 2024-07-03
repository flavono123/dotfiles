if ! command -v rbenv > /dev/null; then
  echo "${BASH_SOURCE}: 'rbenv' could not be found"
else
  export PATH="$HOME/.rbenv/shims:$PATH"

  eval "$(rbenv init -)"
fi
