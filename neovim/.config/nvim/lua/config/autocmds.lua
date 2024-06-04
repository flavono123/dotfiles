-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- typescript
-- local ts_grp = vim.api.nvim_create_augroup("TSAutocmds", {})
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--   group = ts_grp,
--   callback = function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = {
--           "source.fixAll",
--         },
--       },
--     })
--   end,
-- })