local telescope = require('telescope')
local telescopeConfig = require('telescope.config')

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--hidden')
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

telescope.setup({ defaults = { vimgrep_arguments = vimgrep_arguments } })

local M = {}

function M.project_files()
  vim.fn.system('git rev-parse --is-inside-work-tree')

  if vim.v.shell_error == 0 then
    require'telescope.builtin'.git_files({ show_untracked = true })
  else
    require'telescope.builtin'.find_files()
  end
end

return M
