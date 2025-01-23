[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
# flake.nix

NixOS system [flake](https://nixos.wiki/wiki/Flakes)

## Hosts

| **Name** | **Description** | **Status** |
| - | - | - |
| dtop | My laptop (misleading name I know) | ![dtop config status](https://img.shields.io/badge/1--23--25-evaluates-41439a)
| winnix | WSL on windows (until I move my desktop to linux again) | ![winnix config status]()

## Usage

### Setup
Clone the repo (I keep mine in my home directory for easy access)

```sh
git clone https://github.com/danninx/flake.nix
cd dnix
```

> [!NOTE]
> If the settings don't already exist in your repository, you'll need to enable them first before trying to use the flake:
```nix
...
nix.settings.experimental-features = [ "flakes" "nix-command" ];
nixpkgs.config.allowUnfree = true;
```

> [!CAUTION]
> Be sure to edit the `system.stateVersion` in the host files to match whatever is in your current configuration for maximum compatability

### `make` aliases
The Makefile has commands for switching between different host configs:
```sh
make <HOST>

# this is the same as
sudo nixos-rebuild switch --flake ".#<HOST>"
```

after which, a shorthand for flake rebuilding is provided:
```sh
make switch

# same as
sudo nixos-rebuild switch --flake .
```

## To-Do

- Switching to Hyprland / [Troubleshoot launch issue](https://github.com/hyprwm/Hyprland/issues/6967)
- Go back to bash(? researching this)
- Setup docker and container building
- Make iso image host
- Keep refactoring
