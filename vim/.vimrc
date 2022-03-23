call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" 무인도에 들고 갈 옵션
set sw=2 ts=2 et nu hlsearch backspace=2
syntax on

" finder
let mapleader=","
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>f :Rg<CR>

" scroll in tmux
set mouse=a

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
