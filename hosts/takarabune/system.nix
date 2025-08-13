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
    hyprland.enable         = false;
    keybase.enable          = false;
    latex.enable            = false;
    plasma6.enable          = true;
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

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableAllFirmware = true;

  programs.starship.enable = true;

  system.stateVersion = "25.05";
}

