{ config, inputs, pkgs, ... }:

{
   imports =
      [
         ./hardware-configuration.nix # From hardware scan - DO NOT USE MINE UNLESS YOU HAVE THE SAME HARDWARE
         inputs.home-manager.nixosModules.default
         ./core
         ./modules
      ];

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

   # Enable the X11 windowing system.
   services.xserver.enable = true;

   # KDE
   services.desktopManager.plasma6.enable = true;
   environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
   ];
   services.displayManager.sddm.enable = true;
   services.displayManager.sddm.wayland.enable = true;
   services.displayManager.defaultSession = "plasma";

   # Hyprland
   # programs.hyprland = {
   #    enable = true;
   #    xwayland.enable = true;
   # };

   # Enable sound with pipewire.
   hardware.pulseaudio.enable = false;
   security.rtkit.enable = true;
   services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
   };

   users.users.danninx = {
      isNormalUser = true;
      description = "danninx";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
         discord
         flameshot
         git
      ];
   };

   home-manager = {
      backupFileExtension = ".bak";
      extraSpecialArgs = { inherit inputs; };
      users = {
         "danninx" = import ./home.nix;
      };
   };

   nixpkgs.config.allowUnfree = true;

   environment.systemPackages = with pkgs; [
      kitty 
      gnumake
      gcc
      clang
      cl
      jdk
      zig
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
