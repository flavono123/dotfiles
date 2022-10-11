## Prerequisuite
```sh
# MacOS
## Install Homebrew
## ref. https://brew.sh/
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install the bash and change as the default shell
$ brew install bash

## Install packages
$ brew install starship ripgrep wget
```

## Install
```sh
# Migrate from the local $HOME to dotfiles
$ cp * -r ~/<config/path> <pkg>

# link
$ stow -nv -S <pkg> -t ~        # test before install
$ stow -v -S <pkg> -t ~
$ stow -v -S <pkg> -t ~ --adopt # overwirte to existing files
```
