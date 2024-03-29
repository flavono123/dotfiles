vim.cmd([[
call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'stevearc/aerial.nvim'

Plug 'hashivim/vim-terraform'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

call plug#end()

" 무인도에 들고 갈 옵션
set sw=2 ts=2 et nu hlsearch backspace=2
syntax on

" finder
let mapleader=","
nnoremap <leader>p :Files<CR>
" nnoremap <leader>f :Rg<CR>

" buffer
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>k :bfirst<CR>
nnoremap <leader>j :blast<CR>
nnoremap <leader>b :ls<CR>:b<Space>

" statusline
function! GitBranch()
  " TODO: from the file's git root, not the location vim running
  return system("git br --show-current HEAD 2>/dev/null | tr -d '\n'")
endfunction

" ref. https://vimhelp.org/options.txt.html#%27statusline%27
" #..#(surround): highlight; check command - :so $VIMRUNTIME/syntax/hitest.vim
" f             : path
" m             : modification flag
function! StatuslineLeft()
  return "%#PmenuSel#%{GitBranch()}%#LineNr# %f%m"
endfunction

" y             : file type
" l             : line number
" c             : column number
function! StatuslineRight()
  return "%=%#CursorColumn# %y %{&fileencoding} %l:%c "
endfunction

set laststatus=2   " turn the statusline on always
set statusline=%{%StatuslineLeft()%}
set statusline+=%{%StatuslineRight()%}

" remove trailing whitespaces each line
autocmd BufWritePre * %s/\s\+$//e

" autoreload the file when changed
set autoread

if &diff
  set diffopt=internal,indent-heuristic,filler,context:10000000
endif

" Yank to clipboard
set clipboard=unnamed
]])

require('plugins')
require('config')
require('colorschemes')
