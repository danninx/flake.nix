{ config, lib, ... }:

{
  config = (
    lib.mkIf config.modules.hyprland.preset.enable {
      wayland.windowManager.hyprland.settings = {
        "$window" = "SUPER";

        bind = [
          # GENERAL
          "$window, T, exec, $terminal"
          "$window, Q, killactive"
          "SUPER SHIFT, M, exit"
          "$window, V, togglefloating"
          "$window, L, exec, hyprlock"
          "$window SHIFT, S, exec, hyprshot --freeze --clipboard-only --mode region; sleep 0.5s && wl-paste | swappy -f -"
          "$window SHIFT, P, exec, hyprshot --freeze --mode output -m HDMI-A-1 -t 1000"
          "$window, A, exec, $menu"
          "SUPER, F, fullscreen"

          # Switch workspaces with mainMod + [0-6]
          "$window, 1, workspace, 1"
          "$window, 2, workspace, 2"
          "$window, 3, workspace, 3"
          "$window, 4, workspace, 4"
          "$window, 5, workspace, 5"
          "$window, 6, workspace, 6"

          # Move window to worksapce with mainod + [0-6]
          "$window SHIFT, 1, movetoworkspace, 1"
          "$window SHIFT, 2, movetoworkspace, 2"
          "$window SHIFT, 3, movetoworkspace, 3"
          "$window SHIFT, 4, movetoworkspace, 4"
          "$window SHIFT, 5, movetoworkspace, 5"
          "$window SHIFT, 6, movetoworkspace, 6"

          # shell
          "$window, b, global, danni-shell:toggle-bar"
        ];

        # BIND FLAGS - see https://wiki.hypr.land/Configuring/Binds/#bind-flags

        # repeats when held
        binde = [
          # Move focus using MOD + ARROWKEY
          "$window, left, movefocus, l"
          "$window, right, movefocus, r"
          "$window, up, movefocus, u"
          "$window, down, movefocus, d"

          # Move workspace + move window to workspace incrementally
          "$window, k, workspace, e+1"
          "$window, j, workspace, e-1"
          "$window SHIFT, k, movetoworkspace, e+1"
          "$window SHIFT, j, movetoworkspace, e-1"
        ];

        # mouse binds
        bindm = [
          "$window, mouse:272, movewindow"
          "$window, mouse:273, resizewindow"
        ];

        # repeats when held; allowed during lock
        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioPause, exec, playerctl play-pause"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioPrev, exec, playerctl previous"
        ];
      };
    }
  );
}
