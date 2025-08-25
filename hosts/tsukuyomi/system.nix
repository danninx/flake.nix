{ lib, pkgs, ... }:

let
  core = ../../nixos/core;
  host-modules = ./modules;
  modules = ../../nixos/modules;
  packages = ./packages.nix;
in

{
  imports = [
    core
    host-modules
    modules
    packages
  ];

  networking.hostName = "tsukuyomi";

  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.loader.efi.efiSysMountPoint = lib.mkForce "/boot/efi";

  dnix = { 
    docker.enable           = true;
    hyprland.enable         = true;
    keybase.enable          = true;
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

  programs.starship.enable = true;
  programs.tim.enable = true;

  environment.sessionVariables.EDITOR = "nvim";
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "danninx";
    };

    defaultSession = "hyprland";
  };

  # i2c/ddc for monitor brightness management
  hardware.i2c.enable = true;
  environment.systemPackages = [ pkgs.kdePackages.dolphin ];

  users.mutableUsers = false;
  users.users.danninx.hashedPasswordFile = "/persist/passwords/danninx";

  system.stateVersion = "25.05";
}
