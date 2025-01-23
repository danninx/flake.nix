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

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/hyprland";
      submodules = true;
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
    nixos-wsl,
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

        nixvim.nixosModules.nixvim
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager

        {
          home-manager.backupFileExtension = "hm-backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.danninx = import homeconfig;
          home-manager.extraSpecialArgs = { inherit inputs outputs system; };

          nixpkgs.config.allowUnfree = true;
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
        }
      ] ++ extraModules;
    };

  in

  {
    nixosConfigurations = {
      # Configurations for different systems go here
      "dtop" = mkSystem "dtop" {
        system = "x86_64-linux";
        # extraModules = [];
      };

      # WSL - look into changing this name at home
      "nixos" = mkSystem "winnix" {
        system = "x86_64-linux";
        extraModules = [
          nixos-wsl.nixosModules.default
        ];
      };
    };
  };
}
