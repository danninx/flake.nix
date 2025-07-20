{ config, lib, pkgs, ... }:

let 
  symlink = config.lib.file.mkOutOfStoreSymlink;
  getFileName = path: lib.last (lib.splitString "/" ( toString path)); 
  link = path: {name = (getFileName path); value = { source = symlink path;};};
  symlinks = list: builtins.listToAttrs (map link list);
in
{
  imports = [
    ../../home/modules
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "24.05";
  home.sessionVariables = {};

  #home.file.".wezterm.lua".source = symlink /home/danninx/dnix/dotfiles/.wezterm.lua;
  home.file = symlinks [
    /home/danninx/dnix/dotfiles/.wezterm.lua
  ];
  # home.file = builtins.listToAttrs (map (name: {name = "${name}"; value = { source = /home/danninx/dotfiles/${name};};}) [ ".wezterm.lua" ]);
  #[
  #  /home/danninx/dnix/dotfiles/.wezterm.lua
  #]

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;
}
