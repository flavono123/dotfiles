vim.cmd([[
call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" 무인도에 들고 갈 옵션
set sw=2 ts=2 et nu hlsearch backspace=2
syntax on

" finder
let mapleader=","
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Rg<CR>

" buffer
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>k :bfirst<CR>
nnoremap <leader>j :blast<CR>
nnoremap <leader>b :ls<CR>:b<Space>

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

" autoreload the file when changed
set autoread


" The hl-NormalFloat, the highlight group of float window of neovim, is linked
" to Pmenu, change it as vim, to be same with Normal
hi link NormalFloat Normal
]])

require("mason").setup()
require("mason-lspconfig").setup()

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

require('lspconfig')['bashls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
