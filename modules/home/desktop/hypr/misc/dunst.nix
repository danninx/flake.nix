{ config, lib, ... }:

{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    services.dunst = {
      settings = {
        global = {

        };

      };
    };
  });
}
