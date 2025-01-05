{ config, inputs, pkgs, ... }:

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
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      kitty 
      gnumake
      gcc
      clang
      cl
      jdk
      zig

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

    # temporary
    keybase-gui

    tree

    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
  ];


  fonts.packages = with pkgs; [
    nerdfonts
  ];

   # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   hardware.bluetooth.enable = true;
   hardware.bluetooth.powerOnBoot = true;

   # Garbage Collection
   nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 30d";
   };

   system.stateVersion = "24.05";
 }

