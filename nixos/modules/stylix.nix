{ pkgs, ... }:

let
  wallpaper = ../../home/assets/gruvbox-flake.png;
in
  {
    stylix = {
      enable = true;

      autoEnable = false;
      image = wallpaper;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

      cursor = {
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-light";
        size = 14;
      };

      opacity = {
        popups = 0.95;
        terminal = 0.95;
      };

      targets.nixvim = {
        enable = true;
        transparentBackground = {
          main = true;
          signColumn = true;
        };
      };
    };
  }
