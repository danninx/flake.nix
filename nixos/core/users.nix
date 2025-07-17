{ config, pkgs, ... }:

{
  users.users.danninx = import ./users/danninx.nix { inherit config pkgs; };
  programs.zsh.enable = true; # TODO determine a better way of doing this
}
