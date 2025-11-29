{ config, lib, ... }:

{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    xdg.configFile = {
      "dunst/dunstrc".source = ./dunstrc;
      "dunst/sounds".source = ./sounds;
      "dunst/playsound.sh".source = ./playsound.sh;
    };
  });
}
