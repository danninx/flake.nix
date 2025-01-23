{ pkgs, ... }:

let
  nixvim = ../../nixos/modules/neovim;
in

{
  imports = [
    nixvim
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
