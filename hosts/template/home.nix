{ pkgs, ... }:

{
  imports = [
    ../../home/modules
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "25.05";
  home.sessionVariables = {};

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.home-manager.enable = true;
}
