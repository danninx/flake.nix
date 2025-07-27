{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.hyprland;
in
  {
    options = {
      dnix.hyprland.enable = mkEnableOption "installation of hyprland and associated packages";
      dnix.hyprland.unconfigured = mkEnableOption "enable if hyprland is not configured to include necessary setup packages with hyprland default config";
    };

    config = mkMerge  [
      (mkIf cfg.enable {
        programs.hyprland = {
          enable = true;
          xwayland.enable = true;
        };

        environment = {
          sessionVariables = {
            AQ_DRM_DEVICES = "/dev/dri/card1";
            NIXOS_OZONE_WL = "1";
          };

          systemPackages = with pkgs; [
            dunst
            eww
            hypridle
            hyprlock
            hyprpicker
            hyprshot
            jq
            libnotify
            rose-pine-cursor
            socat
            swappy
            swww 
            waybar
            wl-clipboard
          ];
        };

        programs.hyprlock.enable = true;
        services.hypridle.enable = true;
        security.pam.services.hyprlock = { };

        xdg.portal.enable = true;
        xdg.portal.extraPortals =  with pkgs; [ 
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];

      }) # The below need only be enabled if hyprland config is not setup
      (mkIf cfg.unconfigured {
        environment.systemPackages = with pkgs; [
          kitty
        ];
      })
    ];
  }
