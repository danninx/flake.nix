{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dnix.vms.enable = mkEnableOption "installation of libvirtd, virt-manager and associated packages";
  };

  config = mkIf config.dnix.vms.enable {
    programs.virt-manager.enable = true;
    programs.dconf.enable = true;
    # Note: make sure to run "virsh net-autostart default" for proper networking

    users.groups.libvirtd.members = [ "danninx" ];
    users.extraGroups.libvirtd.members = [ "danninx" ];

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice 
      spice-gtk
      spice-protocol
    ];
  };
}
