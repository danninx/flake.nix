{ config, defaultPkgs, otherPkgs, pkgs, ... }:

let
  userPkgs = with otherPkgs; []; # define custom packages above and put them here
in

{
    isNormalUser = true;
    description = "templateUser";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [

    ] ++ defaultPkgs ++ userPkgs;
    # shell = pkgs.zsh;
}

# to use the template, copy into another file and define options, then use:
#   users.users.<name> = import <file> { inherit config pkgs; };
