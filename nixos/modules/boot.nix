{ config, lib, ... }:
with lib; let
  silentBoot = config.dnix.silentBoot;
  mkIfElse = p: yes: no: mkMerge [
    (mkIf p yes)
    (mkIf (!p) no)
  ];
in
  {
   # Bootloader.
   options = {
     dnix.silentBoot.enable = mkEnableOption "enable silent boot configuration (uses systemd-boot), otherwise defaults to grub";
   };

   config = mkIfElse silentBoot.enable
   # silent boot
   {
     boot = {
       loader = {
         systemd-boot = {
           editor = false;
           enable = true;
         };
         efi.canTouchEfiVariables = true;
       };

       kernelParams = [
         "quiet"
         "splash"
         "vga=current"
         "rd.systemd.show_status=false"
         "rd.udev.log_level=3"
         "udev.log_priority=3"
       ];

       consoleLogLevel = 0;
       initrd.verbose = false;
     };
   }
   # grub boot
   {
     boot = {
       loader = {
         efi.canTouchEfiVariables = true;
         grub = {
           enable = true;
           devices = [ "nodev" ];
           efiSupport = true;
           useOSProber = true;
           configurationLimit = 8;
           extraEntries = ''
             menuentry "Reboot" {
             reboot
             }
             menuentry "Poweroff" {
             halt
             }
           '';
         };
       };

       kernelParams = [ "quiet" "splash" ];
       initrd.verbose = false;
     };
   };
 }
