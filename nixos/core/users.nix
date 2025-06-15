{ config, pkgs, ... }:

let
  otherPkgs = import ./otherPkgs.nix { inherit pkgs; };
  defaultPkgs = with pkgs; [
      fuzzel
      python312
      unzip
      vlc
  ]; 
in
{
  users.users.danninx = import ./users/danninx.nix { inherit config defaultPkgs otherPkgs pkgs; };
}
