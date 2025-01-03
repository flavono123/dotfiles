return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "all" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = true },
          },
        },
      },
      terraformls = {
        filetypes = { "hcl", "tf", "tfvars" },
      },
      groovyls = {
        cmd = { "groovy-language-server" },
        -- filetypes = { "groovy", "Jenkinsfile" },
      },
    },
  },
}
