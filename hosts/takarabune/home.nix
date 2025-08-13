{ config, lib, pkgs, ... }:

let 
  symlink = config.lib.file.mkOutOfStoreSymlink;
  getFileName = path: lib.last (lib.splitString "/" ( toString path)); 
  link = path: {name = (getFileName path); value = { source = symlink path;};};
  symlinks = list: builtins.listToAttrs (map link list);
  alwaysOn = ../../home/modules/always;
in
{
  imports = [
    alwaysOn

    ../../home/modules/optional/fuzzel.nix
    ../../home/modules/optional/firefox.nix
    ../../home/modules/optional/stylix.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "25.05";
  home.sessionVariables = {};

  gtk.gtk2.force = true;

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;
}
