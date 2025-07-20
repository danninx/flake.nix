{ config, lib, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix") 
  ];

  boot.initrd.availableKernelModules = [ 
    "xhci_pci" 
    "ahci" 
    "nvme" 
    "usbhid" 
    "usb_storage" 
    "sd_mod" 
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/eea7c6b7-8e44-49a4-a56c-266e750e02d9";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/BC86-3173";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/84c5d048-6264-41a0-9174-4facc1a5f7a0"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
