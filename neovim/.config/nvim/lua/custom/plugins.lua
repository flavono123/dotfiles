local telescope = require('telescope')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden", -- 추가된 옵션
      "--glob",
      "!**/.git/*",
    },
  },
  pickers = {
    find_files = {
      find_command = {
            'rg',
            '--files',
            '--hidden',
            '--glob',
            '!**/.git/*'
          }
      }
  }
})
