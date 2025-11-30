{ config, lib, ... }:

{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "$HOME/dnix/assets/images/kyriemocha.png";
        wallpaper = ", $HOME/dnix/assets/images/kyriemocha.png";
      };
    };
  });
}
