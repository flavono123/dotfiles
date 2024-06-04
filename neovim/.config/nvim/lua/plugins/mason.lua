return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Jenkinsfile
      "groovy-language-server", -- failed by; Could not open cp_proj generic class cache for build file ...
      "npm-groovy-lint",
    },
  },
}
