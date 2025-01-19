{ config, lib, inputs, pkgs, ... }:

let
  core = ../../nixos/core;
  modules = ../../nixos/modules;
  extra = name: import (../../nixos/modules + "/${name}");
in

  {
    imports = [
      core
      modules
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "03:45" ];

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      alacritty
      kitty 

      gnumake
      gcc
      jdk
      zig
      wget

      libreoffice-qt
      hunspell
      hunspellDicts.uk_UA

      tmux
      zathura
      sioyek

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })

      keybase-gui

      virt-manager
      virt-viewer
      spice 
      spice-gtk
      spice-protocol

      vlc
    ];

    fonts.packages = with pkgs; [
      nerdfonts
    ];

    services.openssh.enable = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    system.stateVersion = "24.05";
  }

