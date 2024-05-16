source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files -L'
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_COMPLETION_TRIGGER='~~'

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --all --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# install fzf-git.sh
fzf_git_file="$HOME"/fzf-git.sh

if [[ ! -f $fzf_git_file ]]; then
  curl -s -o $fzf_git_file "https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh"
fi

. "$fzf_git_file"
