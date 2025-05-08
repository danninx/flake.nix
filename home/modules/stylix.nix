{ pkgs, ... }:

let
  fontSize = 11;
in
  {
    stylix = {
      cursor = {
        package = pkgs.phinger-cursors;
        name = "phinger-cursors";
        size = 24;
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
        firefox.enable = true;
        fuzzel.enable = true;
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
