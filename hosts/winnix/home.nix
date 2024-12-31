{ config, home-manager, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home-manager/modules/git.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
} 
