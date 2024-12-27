[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
# flake.nix

NixOS system [flake](https://nixos.wiki/wiki/Flakes) using [Home-manager](https://nix-community.github.io/home-manager/) and [Stylix](https://stylix.danth.me/).

## Usage
Clone and rebuild first:

```sh
git clone https://github.com/danninx/flake.nix && cd dnix
nixos-rebuild switch --flake .
```

Afterwards, a makefile can be used for some shorter commands

Rebuilding:
```sh
make switch
```

Editing with sudo
```sh
make edit
```

## To-Do

- Switching to Hyprland
- Configure for multiple hosts
- Cleanup code
- Fix git home configuration
- Setup docker

