{ config, lib, ... }:

let
  cfg = config.modules.hyprland;
  onDefault = config: (
    if cfg.defaultMonitor == null
    then config
    else config + ", monitor:" + cfg.defaultMonitor
  );
in
{
  config = (lib.mkIf cfg.preset.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [
      {
        workspace = [
          (onDefault "1, persistent:true, default:true")
          (onDefault "2, persistent:true")
          (onDefault "3, persistent:true")
          (onDefault "4, persistent:true")
          (onDefault "5, persistent:true")
          (onDefault "6, persistent:true")
          (onDefault "6, persistent:true")
        ];

        windowrule = [ "workspace 1, class:firefox" ];
        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
      }
      { 
        # Steam 
        bind = [
          "$window, E, togglespecialworkspace, games"
          "$window SHIFT, E, movetoworkspace, special:games"
        ];

        windowrule = [ "workspace special:games silent, class:steam" ];
        windowrulev2 = [
          "float, onworkspace:f[special:games]"
          "tile, onworkspace:f[special:games], initialTitle:^(Steam)$"
        ];
      }
      {
        # discord
        bind = [
          "$window, D, togglespecialworkspace, discord"
          "$window SHIFT, D, movetoworkspace, special:discord"
        ];

        windowrule = [ "workspace special:discord, class:discord" ];
      }
      {
        # reading
        bind = [
          "$window, R, togglespecialworkspace, reading"
          "$window SHIFT, R, movetoworkspace, special:reading"
        ];

        windowrule = [ "workspace special:reading, class:Keybase" ];
      }
    ];
  });
}
