require('os')

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

require("null-ls").setup({
  debug = true,
})

local yamllint = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "yaml" },
  generator = null_ls.generator({
    command = "yamllint",
    args = { "-c", os.getenv('HOME') .. "/.config/yamllint/config/default", "--format", "parsable", "-" },
    to_stdin = true,
    from_stderr = true,
    -- choose an output format (raw, json, or line)
    format = "line",
    check_exit_code = function(code, stderr)
      local success = code <= 1

      if not success then
        -- can be noisy for things that run often (e.g. diagnostics), but can
        -- be useful for things that run on demand (e.g. formatting)
        print(stderr)
      end

      return success
    end,
    -- use helpers to parse the output from string matchers,
    -- or parse it manually with a function
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
        groups = { "row", "col", "message" },
      },
      {
        pattern = [[:(%d+) [%w-/]+ (.*)]],
        groups = { "row", "message" },
      },
    }),
  }),
}

null_ls.register(yamllint)
