{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/99d63b21-85df-461b-9305-d9e6b58a38a7";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/7f168a07-80cd-41bd-89ca-4b93988ff743";

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/99d63b21-85df-461b-9305-d9e6b58a38a7";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/99d63b21-85df-461b-9305-d9e6b58a38a7";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/99d63b21-85df-461b-9305-d9e6b58a38a7";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/99d63b21-85df-461b-9305-d9e6b58a38a7";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/d9a8659f-7a4e-414c-9ffe-0c71f545d8a4";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/FE2B-5157";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/563760b5-6b0b-4306-9c13-b50b0c6d6d79"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
