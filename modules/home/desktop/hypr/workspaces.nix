{ config, lib, ... }:

let
  cfg = config.modules.hyprland;
in
{
  config = (
    lib.mkIf cfg.preset.enable {
      programs.hyprflake.workspaces = {
        "1" = { persistent = true; };
        "2" = { persistent = true; };
        "3" = { persistent = true; };
        "4" = { persistent = true; };
        "5" = { persistent = true; };
        "6" = { persistent = true; };

        "code" = { special = true; };
        "discord" = { special = true; };
        "steam" = { special = true; };
        "reading" = { special = true; };
      };

      wayland.windowManager.hyprland.settings = {

      };
    }
  );
}
