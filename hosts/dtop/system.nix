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
      kitty 
      gnumake
      gcc
      clang
      cl
      jdk
      zig
      ghc

      libreoffice-qt
      hunspell
      hunspellDicts.uk_UA
      wget

      tmux
      zathura
      sioyek
      texliveFull

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })

      signal-desktop

      keybase-gui

      virt-manager
      virt-viewer
      spice 
      spice-gtk
      spice-protocol

      vlc
      spotify

      arduino
    ];

    fonts.packages = [
      pkgs.nerd-fonts._0xproto
      pkgs.nerd-fonts.droid-sans-mono
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

