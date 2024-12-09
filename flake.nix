{
   description = "A very basic flake";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };

   outputs = { self, home-manager, nixpkgs, ... } @ inputs:
      let
         inherit (self) outputs;
      in
         {
         nixosConfigurations = {
            "dtop" = nixpkgs.lib.nixosSystem {
               specialArgs = { inherit inputs outputs; };
               system = "x86_64-linux";
               modules = [
                  ./nixos/configuration.nix
                  home-manager.nixosModules.home-manager
                  {
                     home-manager.backupFileExtension = ".bak";

                     home-manager.useGlobalPkgs = true;
                     home-manager.useUserPackages = true;
                     home-manager.users.danninx = import ./home-manager/home.nix;
                  }
               ];
            };
         };
      };
}
