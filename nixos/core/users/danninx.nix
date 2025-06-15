{ config, defaultPkgs, otherPkgs, pkgs, ... }:

let
  userPkgs = with otherPkgs; [
    obs
    tim
  ];
in

{
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "dialout" "networkmanager" "wheel" "wireshark" ];
    packages = with pkgs; [
      arduino-ide
      discord
      go
      inkscape
      jetbrains.idea-ultimate
      libreoffice-qt
      hunspell
      lazygit
      nix-prefetch-git
      obsidian
      proton-pass
      qbittorrent
      sioyek
      vmware-workstation
      wireshark
    ] ++ defaultPkgs ++ userPkgs;

    shell = pkgs.zsh;
}
