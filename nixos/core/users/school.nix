#TODO
{ config, otherPkgs, pkgs, ... }:

let
  # define custom packages above and put them here
  userPkgs = with otherPkgs; [
    tim
  ];
in

{
    isNormalUser = true;
    description = "templateUser";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [
      
    ] ++ defaultPkgs ++ userPkgs;
    shell = pkgs.zsh;
}
