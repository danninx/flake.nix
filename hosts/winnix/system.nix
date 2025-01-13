{ config, lib, pkgs, nixpkgs, ... }:

let
  core = ../../nixos/core;
  modules = ../../nixos/modules;
  # extra = name: builtins.toString (modules + "/${name}"); // probably a bit too much abstraction?
in

{
  imports = [
    ../../nixos/modules/neovim
  ];


  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    wget
    git
    gnumake
  ];
}
