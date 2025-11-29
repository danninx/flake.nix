{ config, lib, ... }:

{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "$HOME/dnix/backgrounds/kyriemocha.png";
        wallpaper = ", $HOME/dnix/backgrounds/kyriemocha.png";
      };
    };
  });
}
