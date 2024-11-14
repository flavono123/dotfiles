return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      -- timeout_ms = 5000,
    },
    formatters_by_ft = {
      groovy = { "npm-groovy-lint" },
    },
    -- format_on_save = {
    --   enabled = false,
    -- },
  },
}
