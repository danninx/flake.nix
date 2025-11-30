{
  description = "danninx/flake.nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
    nixvim.url = "github:nix-community/nixvim";
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
