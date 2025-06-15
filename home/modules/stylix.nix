{ inputs, pkgs, ... }:

let
  fontSize = 12;
in
  {
    stylix = {
      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "rose-pine-cursor";
        size = 20;
      };

      fonts = {
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };

        sansSerif = {
          package = pkgs.noto-fonts-cjk-sans;
          name = "Noto Sans CJK JP";
        };

        monospace = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = fontSize;
          desktop = fontSize;
          popups = fontSize;
          terminal = fontSize;
        };
      };

      targets = {
        alacritty.enable = true;
        firefox = {
          enable = true;
          profileNames = [ "danninx" ];
        };
        fuzzel.enable = true;
        lazygit.enable = true;
        kde.enable = true;
        nixvim = {
          enable = true;
          plugin = "mini.base16";
          transparentBackground = {
            main = true;
            numberLine = true;
            signColumn = true;
          };
        };
      };
    };
  }
