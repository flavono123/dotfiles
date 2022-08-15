" https://ls3.io/posts/jenkinsfile_vim_highlighting/
augroup jenkins
  au!
  au BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END
