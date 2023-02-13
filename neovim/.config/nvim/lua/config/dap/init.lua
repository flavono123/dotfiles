local function configure()
  local dap_breakpoint = {
    error = {
      text = '🟥',
      texthl = 'LspDiagnosticsSignError',
      linehl = '',
      numhl = '',
    },
    rejected = {
      text = '',
      texthl = 'LspDiagnosticsSignHint',
      linehl = '',
      numhl = '',
    },
    stopped = {
      text = '⭐️',
      texthl = 'LspDiagnosticsSignInformation',
      linehl = 'DiagnosticUnderlineInfo',
      numhl = 'LspDiagnosticsSignInformation',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
  vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
  vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
end

local function configure_exts()
  require('nvim-dap-virtual-text').setup { commented = true }

  local dap, dapui = require 'dap', require 'dapui'
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] =
    function() dapui.close() end
end

configure()
configure_exts()
require('config.dap.python')
