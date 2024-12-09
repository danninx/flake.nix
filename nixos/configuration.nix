{ config, inputs, pkgs, ... }:

{
   imports =
      [
         ./hardware-configuration.nix # From hardware scan - DO NOT USE MINE UNLESS YOU HAVE THE SAME HARDWARE
         ./core
         ./modules
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

      tmux
   ];

   # Enable the OpenSSH daemon.
   services.openssh.enable = true;

   # Garbage Collection
   nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
   };

   system.stateVersion = "24.05"; # Did you read the comment?
}
