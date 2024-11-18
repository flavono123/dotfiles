# hot swap; export STARSHIP_CONFIG=~/.configs/<type>.toml
# ref: https://starship.rs/config/#config-file-location

export STARSHIP_CONFIG=$HOME/.config/starship/default.toml # even "default.toml" is not the default path
eval "$(starship init zsh)"
