{ pkgs, ... }:

let
  nixvim = ../../nixos/modules/neovim;
  stylix = ../../nixos/modules/stylix.nix;
in

{
  imports = [
    nixvim
    stylix
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  dnix = {
    vim.enable = true;
  };
}
