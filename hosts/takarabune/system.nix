{ pkgs, ... }:

let
  core = ../../nixos/core;
  host-modules = ./modules;
  modules = ../../nixos/modules;
  packages = ./packages.nix;
in

  {
    imports = [
      core
      modules
      host-modules
      packages
    ];

    networking.hostName = "takarabune";

    dnix = { 
      docker.enable           = false;
      hyprland.enable         = true;
      keybase.enable          = false;
      latex.enable            = false;
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
    services.blueman.enable = true;

    services.thermald.enable = true;
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 60;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 90;

      };
    };

    services.displayManager = {
      autoLogin = {
        enable = true;
        user = "danninx";
      };

      defaultSession = "hyprland";
    };

    boot.kernelPackages = pkgs.linuxPackages_latest;
    hardware.enableAllFirmware = true;
    hardware.i2c.enable = true;

    programs.starship.enable = true;

    system.stateVersion = "25.05";
  }

