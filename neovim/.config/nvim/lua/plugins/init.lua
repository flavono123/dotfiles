vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {}
    end,
  }

  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Formatter
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function() require('null-ls').setup() end,
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- DAP
  use { 'mfussenegger/nvim-dap' }

  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = { 'mfussenegger/nvim-dap' },
  }
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
  use {
    'nvim-telescope/telescope-dap.nvim',
    requires = { 'mfussenegger/nvim-dap' },
  }

  use { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }
  use {
    'jbyuki/one-small-step-for-vimkind',
    module = 'osv',
    requires = { 'mfussenegger/nvim-dap' },
  }
end)
