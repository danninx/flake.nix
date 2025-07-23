{ ... }:

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

  networking.hostName = "jericho";

  dnix = { 
    docker.enable           = true;
    hyprland.enable         = true;
    keybase.enable          = true;
    latex.enable            = true;
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

  programs.starship.enable = true;

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "danninx";
    };

    defaultSession = "hyprland";
  };

  system.stateVersion = "25.05";
}
