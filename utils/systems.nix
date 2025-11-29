{ inputs, outputs, ... }:

{
  mkSystem = name: { system, extraModules ? [] }:

  let
      systemconfig = ../hosts/${name}/system.nix;
      hardwareconfig = ../hosts/${name}/hardware.nix;
      homeconfig = ../hosts/${name}/home.nix;

      overrides = [ (import ../overrides) ];

      mkEnableable = import./mkEnableable.nix { inherit inputs.nixpkgs.lib; };
      mkEnableConfigs = import./mkEnableConfigs.nix { inherit inputs.nixpkgs.lib; };

      defaultConfig = {
          home-manager.backupFileExtension = "home.bak";
          home-manager.extraSpecialArgs = { inherit inputs outputs system; };
          home-manager.sharedModules = [ ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.danninx = import homeconfig;

          nixpkgs.config.allowUnfree = true;
          nixpkgs.config.overlays = overrides;

          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          nix.settings.gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
            randomizedDelaySec = "45min";
          }
          nix.settings.optimise = {
            automatic = true;
            dates = [ "03:45" ];
          }

          programs.nix-ld.enable = true;
      }
  in

  with inputs.nixpkgs.lib; nixosSystem {
      specialArgs = { inherit inputs outputs mkEnableable mkEnableConfigs; };
      system = "x86_64-linux";
      modules = [
        systemconfig
        hardwareconfig

        inputs.nixvim.nixosModules.nixvim
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager

        defaultConfig 
      ] ++ extraModules;
    };
  }
