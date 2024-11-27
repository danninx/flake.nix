{
   description = "A very basic flake";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };

   outputs = { nixpkgs, ... } @ inputs : 
   {
      nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };
         modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
         ];
      };
   };
}
