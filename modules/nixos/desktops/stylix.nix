{ pkgs, ... }:

let
  wallpaper = ../../../assets/images/kyriemocha.png;
in
{
  stylix = {
    enable = true;

    autoEnable = false;
    image = wallpaper;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    opacity = {
      popups = 0.95;
      terminal = 0.95;
    };

    targets.nixvim = {
      enable = true;
      transparentBackground = {
        main = true;
        numberLine = true;
        signColumn = true;
      };
    };
  };
}
