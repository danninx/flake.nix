{ config, lib, ... }:

with lib;
let
  libre = config.dnix.libreoffice;
in
  {
    imports = [
      ./display-manager.nix
      ./docker.nix
      ./grub.nix
      ./hyprland.nix
      ./keybase.nix
      ./latex.nix
      ./libvirt.nix
      ./neovim
      ./nvidia.nix
      ./pipewire.nix
      ./postgres.nix
      ./plasma.nix
      ./steam.nix
      ./stylix.nix
    ];
  }

