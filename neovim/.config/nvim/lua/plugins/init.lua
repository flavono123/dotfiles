vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function() require('null-ls').setup() end,
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
end)
