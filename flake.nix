{
  description = "Danninx configuration files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    tim.url = "github:danninx/tim"; # :)
  };

  outputs = { 
    self, 
    impermanence,
    quickshell,
    ... 
  } @ inputs:

  let
    inherit (self) outputs;
    utils = import ./utils { inherit inputs outputs; };
  in
  {
    nixosConfigurations = {
      "tsukuyomi" = utils.mkDefaultSystem "tsukuyomi";
      
      "takarabune" = utils.mkSystem "takarabune" {
        system = "x86_64-linux";
        extraModules = [
          impermanence.nixosModules.impermanence
        ];
      };
    };
  };
}
