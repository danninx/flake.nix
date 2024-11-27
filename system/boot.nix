{ config, lib, pkgs, ... }:

{
   # Bootloader.
   # boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.loader.grub.enable = true;
   boot.loader.grub.devices = [ "nodev" ];
   boot.loader.grub.efiSupport = true;
   boot.loader.grub.useOSProber = true;
   boot.loader.grub.configurationLimit = 8;
   boot.loader.grub.extraEntries = ''
      menuentry "Reboot" {
         reboot
      }
   menuentry "Poweroff" {
      halt
   }
   '';
}