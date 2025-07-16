{ lib, pkgs, ... }:

let
  core = ../../nixos/core;
  host-modules = ./modules;
  modules = ../../nixos/modules;
  nvidia = ./nvidia.nix;
in

{
  imports = [
    core
    host-modules
    modules
    nvidia
    ./packages.nix
  ];

  networking.hostName = "jericho";

  services.apcupsd.enable = true;
  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  dnix = { 
    docker.enable = false;
    hyprland.enable = true;
    keybase.enable = true;
    latex.enable = true;
    plasma6.enable = true;
    podman.enable = true;
    silentBoot.enable = false;
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
    nerd-fonts.jetbrains-mono
  ];
  programs.starship.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "25.05";
}

