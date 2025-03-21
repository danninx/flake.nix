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
    docker.enable = true;
    hyprland.enable = true; # suddenly started working? checking source tree to see what changed
    keybase.enable = true;
    latex.enable = true;
    plasma6.enable = true;
    vim.enable = true;
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

