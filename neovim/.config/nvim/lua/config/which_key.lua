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
    o = {
      '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>',
      'Recently Opened Files',
    },
  },
}

local dap_keymap = {
  d = {
    name = 'Debug',
    R = { '<cmd>lua require\'dap\'.run_to_cursor()<cr>', 'Run to Cursor' },
    E = {
      '<cmd>lua require\'dapui\'.eval(vim.fn.input \'[Expression] > \')<cr>',
      'Evaluate Input',
    },
    C = {
      '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input \'[Condition] > \')<cr>',
      'Conditional Breakpoint',
    },
    U = { '<cmd>lua require\'dapui\'.toggle()<cr>', 'Toggle UI' },
    b = { '<cmd>lua require\'dap\'.step_back()<cr>', 'Step Back' },
    c = { '<cmd>lua require\'dap\'.continue()<cr>', 'Continue' },
    d = { '<cmd>lua require\'dap\'.disconnect()<cr>', 'Disconnect' },
    e = { '<cmd>lua require\'dapui\'.eval()<cr>', 'Evaluate' },
    g = { '<cmd>lua require\'dap\'.session()<cr>', 'Get Session' },
    h = { '<cmd>lua require\'dap.ui.widgets\'.hover()<cr>', 'Hover Variables' },
    S = { '<cmd>lua require\'dap.ui.widgets\'.scopes()<cr>', 'Scopes' },
    i = { '<cmd>lua require\'dap\'.step_into()<cr>', 'Step Into' },
    o = { '<cmd>lua require\'dap\'.step_over()<cr>', 'Step Over' },
    p = { '<cmd>lua require\'dap\'.pause.toggle()<cr>', 'Pause' },
    q = { '<cmd>lua require\'dap\'.close()<cr>', 'Quit' },
    r = { '<cmd>lua require\'dap\'.repl.toggle()<cr>', 'Toggle Repl' },
    s = { '<cmd>lua require\'dap\'.continue()<cr>', 'Start' },
    t = { '<cmd>lua require\'dap\'.toggle_breakpoint()<cr>',
          'Toggle Breakpoint' },
    x = { '<cmd>lua require\'dap\'.terminate()<cr>', 'Terminate' },
    u = { '<cmd>lua require\'dap\'.step_out()<cr>', 'Step Out' },
  },
}

wk.register(telescop_keymap, opts_n)
wk.register(dap_keymap, opts_n)
