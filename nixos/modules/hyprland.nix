{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.hyprland;
in
  {
    options = {
      dnix.hyprland.enable = mkEnableOption "installation of hyprland and associated packages";
    };

    config = mkIf cfg.enable {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      environment.sessionVariables = {
        AQ_DRM_DEVICES = "/dev/dri/card1";
        NIXOS_OZONE_WL = "1";
      };

      xdg.portal.enable = true;
      xdg.portal.extraPortals =  with pkgs; [ 
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  }
