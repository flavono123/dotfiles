-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<c-q>", "<cmd>q<cr>")
map("n", "<c-n>", "<cmd>enew<cr>")
-- override tabs
-- i think bufferline override or spoil the default tabp and tabN ¯\_(ツ)_/¯
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")

map("v", "<c-c>", '"ay')
map("i", "<c-v>", '<esc>"ap')

map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- map("n", "<c-n>", "<Plug>(YankyNextEntry)")
