{ config, inputs, pkgs, ... }:

{
   # Enable the X11 windowing system.
   services.xserver.enable = true;

   # KDE
   services.desktopManager.plasma6.enable = true;
   environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
   ];
   services.displayManager.sddm.enable = true;
   services.displayManager.sddm.wayland.enable = true;
   services.displayManager.defaultSession = "plasma";
}
