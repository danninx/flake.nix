{ ... }:

let
  nixvim = ../../nixos/modules/optionals/neovim;
  latex = ../../nixos/modules/optionals/latex.nix;
  stylix = ../../nixos/modules/always/stylix.nix;
  tmux = ../../nixos/modules/optionals/tmux.nix;

  packages = ./packages.nix;
in

  {
    imports = [
      nixvim
      stylix
      latex
      tmux

      packages
    ];

    networking.hostName = "wsl";

    dnix = { 
      latex.enable  = false;
      tmux.enable   = true;
      vim.enable    = true;
    };

    wsl = {
      enable = true;
      defaultUser = "danninx";
    };

    system.stateVersion = "24.05";
  }
