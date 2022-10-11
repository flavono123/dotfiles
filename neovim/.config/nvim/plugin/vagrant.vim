" ref. https://gist.github.com/scarolan/5782025
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
