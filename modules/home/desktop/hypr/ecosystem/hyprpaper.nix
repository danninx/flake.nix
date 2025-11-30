{ config, lib, ... }:

let
  cfg = config.modules.hyprland;
  hasWallpaper = lib.lists.filter (m: m.wallpaper != null) cfg.monitors;
  wallpapers = lib.lists.forEach hasWallpaper (m:
    m.wallpaper
  );
in
{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = wallpapers;
        wallpaper = lib.lists.forEach hasWallpaper (m:
          m.port + ", " + m.wallpaper
        );
      };
    };
  });
}
