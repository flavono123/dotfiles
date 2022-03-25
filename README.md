## Install
```sh
stow -nv -S <pkg> -t ~        # test before install
stow -v -S <pkg> -t ~
stow -v -S <pkg> -t ~ --adopt # overwirte to existing files
stow -v -S * -t ~ --adopt     # install all package
```
