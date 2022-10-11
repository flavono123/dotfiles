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

## Install/Uninstall
```sh
# Migrate from the local $HOME to dotfiles
$ cp * -r ~/<config/path> <pkg>

# Link
$ stow -nv -S <pkg> -t ~        # Simulate before install
$ stow -v -S <pkg> -t ~
$ stow -v -S <pkg> -t ~ --adopt # Overwirte to existing files

# Unlink
$ stow -nv -D <pkg> -t ~        # Simulate before uninstall
$ stow -v -D <pkg> -t ~
```
