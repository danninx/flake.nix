{ config, pkgs, ... }:

{
  users.users.danninx = import ./users/danninx.nix { inherit config pkgs; };
}
