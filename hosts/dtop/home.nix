{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/modules
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "24.05";

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
