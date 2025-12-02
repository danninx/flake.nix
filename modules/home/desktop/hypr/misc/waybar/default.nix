{ config, lib, ... }:

{
  config = (
    lib.mkIf config.modules.hyprland.preset.enable {
      xdg.configFile = {
        "waybar/config.jsonc".source = ./config.jsonc;
        "waybar/mocha.css".source = ./mocha.css;
        "waybar/style.css".source = ./style.css;
      };
    }
  );
}
