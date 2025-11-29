let
  follows = url: { # it's a pain and honestly kinda gross to write this over and over
    url = url;
    inputs.nixpkgs.follows = "nixpkgs";
  };
in

{
  description = "danninx/flake.nix";

  inputs = {
    nixpkgs.url       = "github:nixos/nixpkgs/nixos-unstable";

    home-manager      = follows "github:nix-community/home-manager";
    stylix            = follows "github:danth/stylix";

    impermanence.url  = "github:nix-community/impermanence";
    nixvim.url        = "github:nix-community/nixvim";
  };

  outputs = { self, impermanence, ... } @ inputs:
  let
    inherit (self) outputs;
    utils = import ./utils/systems.nix { inherit inputs outputs; };
  in
  {
    nixosConfigurations = {
      "takarabune" = utils.mkSystem "takarabune" {
        system = "x86_64-linux";
        extraModules = [
          impermanence.nixosModules.impermanence
        ];
      };

      "tsukuyomi" = utils.mkSystem "tsukuyomi" {
        system = "x86_64-linux";
      };
    };
  };
}
