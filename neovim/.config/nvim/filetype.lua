require('os')

vim.filetype.add({
  filename = {
    [os.getenv('HOME') .. '/.kube/config'] = 'yaml',
  },
  pattern = {
    ['.*%.yaml%.tftpl'] = 'yaml',
  },
})
