{ config, lib, pkgs, ... }:

let
  pciIDs = [
    "10de:28a0"
    "10de:22be"
  ];

  gpuDriverId = "0000:01:00.0";
in
  with lib;
  {
    options = {
      dnix.vms.enable = mkEnableOption "installation of libvirtd, virt-manager and associated packages";
    };

    config = mkIf config.dnix.vms.enable {
      #boot.kernelModules = [
      #  "vfio-pci"
      #  "vfio_iommu_type1"
      #  "vfio"
      #];

      #boot.kernelParams = [
      #  "intel_iommu=on"
      #  "iommu=pt"
      #  ("vfio-pci.ids=" + builtins.concatStringsSep "," pciIDs)
      #];

      programs.virt-manager.enable = true;
      programs.dconf.enable = true;
    # Note: make sure to run "virsh net-autostart default" for proper networking

      users.groups.libvirtd.members = [ "danninx" ];
      users.extraGroups.libvirtd.members = [ "danninx" ];

      virtualisation = {
        libvirtd = {
          enable = true;

          qemu = {
            package = pkgs.qemu_kvm;
            ovmf = {
              enable = true;
              packages = [ (pkgs.OVMFFull.override {
                secureBoot = true;
                tpmSupport = true;
              }).fd ];
            };
            swtpm.enable = true;
          };
        };

        spiceUSBRedirection.enable = true;
      };

      services.spice-vdagentd.enable = true;

      environment.systemPackages = with pkgs; [
        virtio-win
        virt-manager
        virt-viewer
        spice 
        spice-gtk
        spice-protocol
        win-spice
      ];

      # force GPU to vfio
      # systemd.services.forceRebindNVUSB = {
      #   enable = true;
      #   description = "forceRebindNvUsb";
      #   wantedBy = [ "multi-user.target" ];
      #   script = ''
      #     echo -n "${gpuDriverId}" > /sys/bus/pci/drivers/xhci_hcd/unbind
      #     echo -n "${gpuDriverId}" > /sys/bus/pci/driver/vfio-pci/bind
      #   '';
      #   serviceConfig = {
      #     Type = "oneshot";
      #     RemainsAfterExit = true;
      #   };
      # };
  };

}
