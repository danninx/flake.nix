{ config, lib, pkgs, ... }:

{
  stylix = {
    fonts = {
      sizes.applications = 11;
      sizes.terminal = 11;
    };

    targets = {
      kde.enable = true;
      kitty.enable = true;
      firefox.enable = true;
    };
  };
}
