{ config, lib, pkgs, ... }:

{
   imports = [
      ./docker.nix
      ./grub.nix
      # ./hyprland.nix
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
