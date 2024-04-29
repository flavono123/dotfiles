local telescope = require "telescope"

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never", -- copy default
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden", -- custom start
      "--glob",
      "!**/.git/*",
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden", -- custom start
        "--glob",
        "!**/.git/*",
      },
    },
  },
}
