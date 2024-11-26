{ config, inputs, pkgs, ... }:

{
   imports =
      [
      ./hardware-configuration.nix # From hardware scan - DO NOT USE MINE UNLESS YOU HAVE THE SAME HARDWARE
         inputs.home-manager.nixosModules.default
      ];

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

   # Bootloader.
   # boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.loader.grub.enable = true;
   boot.loader.grub.devices = [ "nodev" ];
   boot.loader.grub.efiSupport = true;
   boot.loader.grub.useOSProber = true;
   boot.loader.grub.configurationLimit = 8;
   boot.loader.grub.extraEntries = ''
      menuentry "Reboot" {
         reboot
      }
   menuentry "Poweroff" {
      halt
   }
   '';

   networking = {
      hostName = "nixtop"; # Define your hostname.
      networkmanager.enable = true;
   }

   time.timeZone = "America/Chicago";
   i18n.defaultLocale = "en_US.UTF-8";
   i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
   };

   # NVIDIA
   services.xserver.videoDrivers = [ "nvidia" ];
   hardware.graphics.enable = true;
   hardware.nvidia = {
      modesetting.enable = true;

      # Disable if sleep acts weird
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      prime = {
         offload = {
            enable = true;
            enableOffloadCmd = true;
         };

         intelBusId = "PCI:0:2:0";
         nvidiaBusId = "PCI:1:0:0";
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
   };

   # Enable the X11 windowing system.
   services.xserver.enable = true;

   # GNOME / GDM
   services.xserver.displayManager.gdm.enable = true;
   services.xserver.displayManager.gdm.wayland = true;
   services.xserver.desktopManager.gnome.enable = true;

   # Hyprland
   programs.hyprland = {
      enable = true;
      xwayland.enable = true;
   };

   # Configure keymap in X11
   services.xserver.xkb = {
      layout = "us";
      variant = "";
   };

   # Enable CUPS to print documents.
   services.printing.enable = true;

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
      extraSpecialArgs = { inherit inputs; };
      users = {
         "danninx" = import ./home.nix;
      };
   };

   nixpkgs.config.allowUnfree = true;

   programs.firefox.enable = true;


   environment.systemPackages = with pkgs; [
      kitty
         efibootmgr
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
