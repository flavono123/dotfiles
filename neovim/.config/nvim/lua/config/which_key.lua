local wk = require('which-key')

local opts_n = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local telescop_keymap = {
  f = {
    name = 'file',
    f = {
      '<cmd>lua require(\'config.telescope\').project_files()<cr>', 'Find File',
    },
    g = {
      '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', 'Grep Files',
    },
    b = { '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', 'Buffer' },
    h = { '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', 'Help' },
  },
}

wk.register(telescop_keymap, opts_n)
