{ ... }:

let
  nixvim = ../../nixos/modules/neovim;
  stylix = ../../nixos/modules/stylix.nix;
in

  {
    imports = [
      nixvim
      stylix
      ../../nixos/modules/latex.nix
      ../../nixos/modules/tmux.nix
      ./packages.nix
    ];

    dnix = { 
      latex.enable = false;
      vim.enable = true;
    };


    wsl = {
      enable = true;
      defaultUser = "danninx";
    };

    system.stateVersion = "24.05";
  }
