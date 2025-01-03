{ config, lib, pkgs, ... }:

{
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  users.groups.libvirtd.members = [ "danninx" ];
  users.extraGroups.libvirtd.members = [ "danninx" ];

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Note: make sure to run "virsh net-autostart default" for proper networking
}
