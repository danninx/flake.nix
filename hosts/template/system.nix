{ ... }:

let
  core = ../../nixos/core;
  host-modules = ./modules;
  modules = ../../nixos/modules;
in

{
  imports = [
    core
    host-modules
    modules
    ./packages.nix
  ];

  networking.hostName = "";

  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  dnix = { 
    docker.enable           = false;
    hyprland.enable         = false;
    keybase.enable          = false;
    latex.enable            = false;
    plasma6.enable          = false;
    podman.enable           = false;
    tmux.enable             = false;
    vim.enable              = false;
    vms.enable              = false;
    yubikey-software.enable = false;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      randomizedDelaySec = "45min";
    };

    optimise.automatic = true;
    optimise.dates = [ "03:45" ];
  };

  programs.starship.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "25.05"; # this should come from your default configuration.nix (it's whatever version installer you used, I believe)
}

