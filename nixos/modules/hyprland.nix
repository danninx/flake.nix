{ config, inputs, lib, pkgs, ... }:

{
   # services.displayManager.sddm.enable = true;
   # services.displayManager.sddm.wayland.enable = true;

   programs.hyprland = {
     enable = true;
     xwayland.enable = true;
     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
     portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
   };

   environment.sessionVariables = {
     AQ_DRM_DEVICES = "/dev/dri/card1";
     NIXOS_OZONE_WL = "1";
   };

   xdg.portal.enable = true;
   xdg.portal.extraPortals =  with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
 }
