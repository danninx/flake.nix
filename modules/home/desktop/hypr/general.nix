{ config, lib, ... }:

{
  config = (lib.mkIf config.modules.hyprland.preset.enable {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 2;
        gaps_out = 10;

        border_size = 1;

        "col.active_border" = "rgba(b4befe0f) rgba(eba0ac0f) 45deg";
        "col.inactive_border" = "rgba(1818250a)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.9;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 0, 1.73, almostLinear"
          "fadeOut, 0, 1.46, almostLinear"
          "fade, 0, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 0, 0, almostLinear, none"
          "specialWorkspace, 1, 2, almostLinear, fade"
        ];
      };

      dwindle = {
        psuedotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        disable_hyprland_logo = false;
        force_default_wallpaper = 1;
        key_press_enables_dpms = true;
        mouse_move_enables_dpms = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 2;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      ecosystem = {
        no_update_news = true;
      };
    };
  });
}
