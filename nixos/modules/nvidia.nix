{ config, inputs, lib, pkgs, ... }:
#HP Victus r0xxx
{
   services.xserver.videoDrivers = [ "nvidia" ];
   hardware.graphics.enable = true;
   # hardware.opengl = {
   #    package = hyprpackage.mesa.drivers;
   # };
   hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      prime = {
         offload = {
            enable = true;
            enableOffloadCmd = true;
         };
         intelBusId = "PCI:0:2:0";
         nvidiaBusId = "PCI:1:0:0";
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
   };
}
