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
    hyprland.enable = false; # suddenly started working? checking source tree to see what changed
    keybase.enable = true;
    latex.enable = true;
    plasma6.enable = true;
    silentBoot.enable = true;
    vim.enable = true;
    vms.enable = true;
    wireguard.enable = false;
    yubikey-software.enable = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      randomizedDelaySec = "45min";
    };

    optimise.automatic = true;
    optimise.dates = [ "03:45" ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  system.stateVersion = "24.05";
}

