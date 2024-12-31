{
  description = "Danninx configuration files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
    
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { 
    self, 
    home-manager, 
    nixpkgs, 
    nixvim, 
    stylix, 
    ... 
  } @ inputs:

  let

    inherit (self) outputs;

    # found in https://github.com/martijnboers/nixos/blob/master/flake.nix
    mkSystem = name: {
      system,
      extraModules ? [],
    }: 

    let
      systemconfig = ./hosts/${name}/system.nix;
      hardwareconfig = ./hosts/${name}/hardware.nix;
      homeconfig = ./hosts/${name}/home.nix;
    in
      
    with nixpkgs.lib; nixosSystem {
      specialArgs = { inherit inputs outputs; };
      system = "x86_64-linux";
      modules = [
        systemconfig
        hardwareconfig

        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = "hm-backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.danninx = import homeconfig;
          home-manager.extraSpecialArgs = { inherit inputs outputs system; };
        }

        nixvim.nixosModules.nixvim
      ] ++ extraModules;
    };

  in

  {
    nixosConfigurations = {
      # Configurations for different systems go here
      "dtop" = mkSystem "dtop" {
        system = "x86_64-linux";
        extraModules = [
          stylix.nixosModules.stylix
        ];
      };
    };

    # nixosConfigurations = {
    #   "dtop" = nixpkgs.lib.nixosSystem {
    #     specialArgs = { inherit inputs outputs; };
    #     system = "x86_64-linux";
    #     modules = [
    #       stylix.nixosModules.stylix
    #       nixvim.nixosModules.nixvim
    #       home-manager.nixosModules.home-manager
    #       {
    #         home-manager.backupFileExtension = "hm-backup";

    #         home-manager.useGlobalPkgs = true;
    #         home-manager.useUserPackages = true;
    #         home-manager.users.danninx = import ./home-manager/home.nix;
    #       }
    #       ./nixos/configuration.nix
    #     ];
    #   };
    # };
  };
}
