{
  description = "Danninx configuration files";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { 
    self, 
    nixos-wsl,
    ... 
  } @ inputs:

  let
    inherit (self) outputs;
    utils = import ./utils { inherit inputs outputs; };
  in
  {
    nixosConfigurations = {
      # Configurations for different systems go here
      "dtop" = utils.mkDefaultSystem "dtop";
      "jericho" = utils.mkDefaultSystem "jericho";

      # WSL - look into changing this name at home
      "nixos" = utils.mkSystem "winnix" {
        system = "x86_64-linux";
        extraModules = [
          nixos-wsl.nixosModules.default
        ];
      };
    };
  };
}
