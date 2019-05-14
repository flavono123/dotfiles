call plug#begin('~/.local/share/nvim/plugged')

" Editor
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'

" Ruby on Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

Plug 'kchmck/vim-coffee-script'

" Web
Plug 'mattn/emmet-vim'

call plug#end()

" Use rg for ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Redirect git grep's result to quickfix
" https://stackoverflow.com/questions/21931116/getting-git-grep-to-work-effectively-in-vim
:command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

set mouse=a

let g:user_emmet_leader_key = '<c-e>'

set tabstop=2
set shiftwidth=2
set expandtab
