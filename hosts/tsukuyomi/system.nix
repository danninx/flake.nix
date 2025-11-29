{ lib, pkgs, ... }:

{
  imports = [
    ../../modules/nixos
  ];

  networking.hostName = "tsukuyomi";
  system.stateVersion = "25.05";

  users.mutableUsers = false;
  users.users.danninx.hashedPasswordFile = "/persist/passwords/danninx";

  environment.sessionVariables.EDITOR = "nvim";

  modules = {
    docker.enable = true;
    hyprland = {
      enable = true;
      defaultSession = true;
      user = "danninx";
    };
    latex.enable = true;
    nixvim.enable = true;
  };


  # UPS tools?
  services.apcupsd.enable = true;

  # i2c/ddc for monitor brightness management
  hardware.i2c.enable = true;
  environment.systemPackages = [ pkgs.kdePackages.dolphin ];

  # boot stuff
  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.loader.efi.efiSysMountPoint = lib.mkForce "/boot/efi";

  # Nvidia Configuration
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false;
    };

    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
  };
}
