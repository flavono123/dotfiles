if type brew &>/dev/null; then
  brew_prefix=$(brew --prefix)
  for d in "${brew_prefix}"/Cellar/*/*/libexec/gnubin; do export PATH=$d:$PATH; done
  for d in "${brew_prefix}"/Cellar/*/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
fi
