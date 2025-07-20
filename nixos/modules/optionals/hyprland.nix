{ config, inputs, lib, pkgs, ... }:

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
            hypridle
            hyprlock
            jq
            libnotify
            rose-pine-cursor
            swww 
            waybar
          ];
        };

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
