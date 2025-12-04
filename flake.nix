{
  description = "Danninx configuration files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprflake = {
      url = "github:danninx/hyprflake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    impermanence.url = "github:nix-community/impermanence";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    {
      self,
      impermanence,
      ...
    }@inputs:

    let
      inherit (self) outputs;
      utils = import ./utils/systems.nix { inherit inputs outputs; };
    in
    {
      formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      nixosConfigurations = {
        "tsukuyomi" = utils.mkSystem "tsukuyomi" {
          system = "x86_64-linux";
          extraModules = [ ];
        };

        "takarabune" = utils.mkSystem "takarabune" {
          system = "x86_64-linux";
          extraModules = [
            impermanence.nixosModules.impermanence
          ];
        };
      };
    };
}
