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
    ../../nixos/modules/explicit/java.nix
  ];

  networking.hostName = "dtop";

  dnix = { 
    docker.enable           = true;
    hyprland.enable         = true;
    keybase.enable          = true;
    latex.enable            = true;
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

  programs.starship.enable = true;
  programs.tim.enable = true;

  system.stateVersion = "24.05";
}

