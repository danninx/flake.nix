{ pkgs, ... }:

let
  core = ../../nixos/core;
  modules = ../../nixos/modules;
in

  {
    imports = [
      core
      modules
      ./packages.nix
    ];

    services.openssh.enable = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    dnix = { 
      latex = {
        enable = true;
        vim-support = true;
      };
      vim.enable = true;
      vim.customColors = false;

      keybase.enable = true;

      kde.enable = true;
      hyprland.enable = false; # aquamarine issues? look into this later

      docker.enable = true;
      vms.enable = true;

      wireguard.enable = true;
    };

    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };

      optimise.automatic = true;
      optimise.dates = [ "03:45" ];
    };

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    system.stateVersion = "24.05";
  }

