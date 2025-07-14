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
      air
      bun
      discord
      go
      libreoffice-qt
      hunspell
      lazygit
      nix-prefetch-git
      obsidian
      qbittorrent
      remmina
      sioyek
    ] ++ defaultPkgs ++ userPkgs;

    shell = pkgs.zsh;
}
