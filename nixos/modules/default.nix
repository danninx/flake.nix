{ config, lib, pkgs, ... }:

with lib;
let
  libre = config.dnix.libreoffice;
in
  {
    imports = [
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

    # Extra pacakges and options
    options.dnix = {
      dnix.libreoffice = mkEnableOption "install libreoffice suite and hunspell";
    };

    config = mkMerge [
      (mkIf libre.enable {
        
      })
    ];
  }

