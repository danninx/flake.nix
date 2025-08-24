# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    configurationLimit = 8;
    devices = [ "nodev" ];
    efiSupport = true;
    enable = true;
    extraEntriesBeforeNixOS = false;
    extraEntries = ''
      menuentry "Reboot" {
      reboot
      }
      menuentry "Poweroff" {
      halt
      }
    '';
    useOSProber = true;
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "tsukuyomi"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    sddm.autoNumlock = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.mutableUsers = false;
  users.users.danninx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    packages = with pkgs; [
      vim
      tree
    ];
    hashedPasswordFile = "/persist/passwords/danninx";
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wezterm
    vim 
  ];

  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  system.stateVersion = "25.05";
}

