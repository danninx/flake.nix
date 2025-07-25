{ inputs, outputs }:

rec {
  # mkSystem -- creates a system with given architecture and additional modules
  mkSystem = name: {
    system,
    extraModules ? [],
  }:

  let
      systemconfig = ../hosts/${name}/system.nix;
      hardwareconfig = ../hosts/${name}/hardware.nix;
      homeconfig = ../hosts/${name}/home.nix;
  in

  with inputs.nixpkgs.lib; nixosSystem {
      specialArgs = { inherit inputs outputs; };
      system = "x86_64-linux";
      modules = [
        systemconfig
        hardwareconfig

        inputs.nixvim.nixosModules.nixvim
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager
        inputs.tim.nixosModules.default

        {
          home-manager.backupFileExtension = "home.bak";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.danninx = import homeconfig;
          home-manager.extraSpecialArgs = { inherit inputs outputs system; };
          home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

          nixpkgs = {
            config.allowUnfree = true;
            overlays = [
              (import ../pkgs)
              (import ../overrides)
            ];
          };

          nix = {
            settings.experimental-features = [ "nix-command" "flakes" ];
            gc = {
              automatic = true;
              dates = "weekly";
              options = "--delete-older-than 14d";
              randomizedDelaySec = "45min";
            };

            optimise.automatic = true;
            optimise.dates = [ "03:45" ];

          };

          programs.nix-ld.enable = true;
        }
      ] ++ extraModules;
    };

    # mkDefaultSystem -- creates an x86_64-linux system with no extra modules
    mkDefaultSystem = name: (mkSystem name {
      system = "x86_64-linux" ;
    });
}
