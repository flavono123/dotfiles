local telescope = require "telescope"

-- gitroot에서 .gitignore를 무시하고 검색
local function get_git_root()
  local handle = io.popen "git rev-parse --show-toplevel 2>/dev/null"

  if not handle then
    return
  end

  local result = handle:read "*a"
  handle:close()
  return result:match "(.*)\n"
end

local git_root = get_git_root()
local vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
  "--hidden",
  "--glob",
  "!**/.git/*",
}

if git_root then
  local gitignore_path = git_root .. "/.gitignore"
  if vim.fn.filereadable(gitignore_path) == 1 then
    table.insert(vimgrep_arguments, "--ignore-file")
    table.insert(vimgrep_arguments, gitignore_path)
  end
else
  table.insert(vimgrep_arguments, "--no-ignore-vcs")
end

telescope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
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

local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        fallback()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        fallback()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
  },
}
