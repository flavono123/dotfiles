let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -L -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
