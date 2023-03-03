local wk = require('which-key')

local opts_n = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local lsp_keymap = {
  d = {
    name = 'Diagnostic',
    e = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Open Diagnostic Float' },
    d = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Next Diagnostic' },
    D = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Prev Diagnostic' },
    q = {
      '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Popup Diagnostic List below',
    },
  },
}

wk.register(lsp_keymap, opts_n)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts_n = {
    mode = 'n',
    prefix = '<leader>',
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local lsp_buf_keymap = {
    l = {
      name = 'LSP',
      d = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
      D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to definition' },
      h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
      i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
      s = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature Help' },
      t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Show Type' },
      r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Show References' },
    },
  }

  wk.register(lsp_buf_keymap, bufopts_n)

  -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', '<space>f',
  --                function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = { debounce_text_changes = 150 }

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['ansiblels'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['bashls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['golangci_lint_ls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  init_options = { command = { 'golangci-lint', 'run', '--out-format', 'json' } },
  capabilities = capabilities,
}

require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['lua_ls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
}

require('lspconfig')['ruby_ls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['yamlls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['taplo'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['terraformls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
