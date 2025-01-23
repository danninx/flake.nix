{ config, lib, pkgs, stylix, ... }:

let
  wallpaper = ../../home/assets/wallpaper.png;
in
  {
    stylix = {
      enable = true;

      autoEnable = false;
      image = wallpaper;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-heath.yaml";

      cursor = {
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-light";
        size = 14;
      };

      opacity = {
        popups = 0.95;
      };

      targets.nixvim.enable = true;
    };
  }
