{ pkgs, ... }:

let
  core = ../../nixos/core;
  host-modules = ./modules;
  modules = ../../nixos/modules;
  packages = ./packages.nix;
in

{
  imports = [
    core
    modules
    host-modules
    packages
  ];

  networking.hostName = "takarabune";

  dnix = { 
    docker.enable           = false;
    hyprland.enable         = true;
    keybase.enable          = false;
    latex.enable            = false;
    plasma6.enable          = false;
    podman.enable           = false;
    tmux.enable             = false;
    vim.enable              = true;
    vms.enable              = false;
    yubikey-software.enable = false;
  };

  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "danninx";
    };

    defaultSession = "hyprland";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableAllFirmware = true;
  hardware.i2c.enable = true;

  programs.starship.enable = true;

  system.stateVersion = "25.05";
}

