{ pkgs, ... }:
{
  # grub boot
  config = {
    boot = {
      loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        grub = {
          configurationLimit = 8;
          devices = [ "nodev" ];
          efiSupport = true;
          # efiInstallAsRemovable = true;
          enable = true;
          extraEntriesBeforeNixOS = false;
          extraEntries = ''
             menuentry "Reboot" {
             reboot
             }
             menuentry "Poweroff" {
             halt
             }
          '';
          useOSProber = true;
          theme = pkgs.p5-grub.joker;
        };
      };

      kernelParams = [ "quiet" "splash" ];
      initrd.verbose = false;
    };
  };
}
