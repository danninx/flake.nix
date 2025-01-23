{ ... }:

let
  nixvim = ../../nixos/modules/neovim;
  stylix = ../../nixos/modules/stylix.nix;
in

  {
    imports = [
      nixvim
      stylix
      ./packages.nix
    ];

    dnix = {
      vim.enable = true;
    };

    wsl = {
      enable = true;
      defaultUser = "danninx";
    };

    system.stateVersion = "24.05";
  }
