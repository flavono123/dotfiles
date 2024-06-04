-- Jenkinsfile 파일 유형 설정
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Jenkinsfile",
  command = "set filetype=groovy",
})

return {
  "vim-scripts/groovy.vim",
  ft = "groovy",
}
