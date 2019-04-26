call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'

"Ruby on Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

call plug#end()

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
