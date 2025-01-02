{ config, lib, pkgs, ... }:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "danninx" ];
  users.extraGroups.libvirtd.members = [ "danninx" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
