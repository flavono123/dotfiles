return {
  {
  "mrjones2014/dash.nvim",
  opts = {
      run = "make install",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {"<leader>fd", "<cmd>Dash<cr>"},
    },
    opts = {
      dash = {}
    },
  },
}
