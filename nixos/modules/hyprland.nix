{ config, lib, pkgs, ... }:

{
   services.xserver.enable = true;
   services.xserver.displayManager.sddm.enable = true;
   services.xserver.displayManager.sddm.wayland.enable = true;

   programs.hyprland = {
      enable = true;
      xwayland.enable = true;
   };

   environment.sessionVariables = {
      AQ_DRM_DEVICES = "/dev/dri/card1";
      NIXOS_OZONE_WL = "1";
   };

   xdg.portal.enable = true;
   xdg.portal.extraPortals =  [ pkgs.xdg-desktop-portal-gtk ];
}
