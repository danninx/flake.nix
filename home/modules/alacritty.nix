{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 20;
          y = 10;
        };
      };
    };
  };
}
