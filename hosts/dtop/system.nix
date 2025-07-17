{ pkgs, ... }:

let
  core = ../../nixos/core;
  modules = ../../nixos/modules;
  nvidia = ./nvidia.nix;
in

{
  imports = [
    core
    modules
    nvidia
    ./packages.nix
  ];

  networking.hostName = "dtop";
  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  dnix = { 
    docker.enable = true;
    hyprland.enable = true;
    keybase.enable = true;
    latex.enable = true;
    plasma6.enable = true;
    podman.enable = false;
    vim.enable = true;
    vms.enable = true;
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
  system.stateVersion = "24.05";
}

