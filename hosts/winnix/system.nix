{ ... }:

let
  nixvim = ../../nixos/modules/optionals/neovim;
  stylix = ../../nixos/modules/always/stylix.nix;
in

  {
    imports = [
      nixvim
      stylix
      ../../nixos/modules/optionals/latex.nix
      ../../nixos/modules/optionals/tmux.nix
      ./packages.nix
    ];

    networking.hostName = "wsl";

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
