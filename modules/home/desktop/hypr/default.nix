{ config, lib, ... }:

let
  cfg = config.modules.hyprland;
in
{
  imports = [
    ./bindings.nix
    ./general.nix
    ./rules.nix
    ./workspaces.nix

    ./ecosystem
    ./misc
  ];

  options = {
    modules.hyprland = {
      preset.enable = lib.mkEnableOption "hyprland pre-configuration";

      defaultMonitor = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        description = "Default monitor port/name.";
        example = "DP-1";
      };

      monitors = lib.mkOption {
        type = lib.types.listOf (
          lib.types.submodule {
            options = {
              port = lib.mkOption {
                type = lib.types.str;
                description = "Monitor port/name.";
                example = "DP-1";
              };

              config = lib.mkOption {
                type = lib.types.str;
                description = "The hyprland monitor configuration string.";
                example = "2560x1440@144.00, 0x0, 1";
              };

              wallpaper = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = "Path to the wallpaper for this specific monitor.";
                example = "$HOME/backgrounds/image.png";
              };
            };
          }
        );
      };

      default = [ ];
      description = "A list of monitor configurations for Hyprland.";
      example = [
        {
          port = "DP-1";
          config = "2560x1440@144.00, 0x0, 1";
          wallpaper = "$HOME/dnix/assets/images/kyriemocha.png";
        }
        {
          port = "HDMI-A-1";
          config = "1920x1080@60.00, -1080x240, 1, transform, 1";
          wallpaper = null;
        }
      ];
    };
  };

  config = (
    lib.mkIf cfg.preset.enable {

      assertions =
        let
          ports = lib.lists.forEach cfg.monitors (m: m.port);
        in
        [
          {
            assertion = lib.lists.elem cfg.defaultMonitor ports;
            message = "default monitor must be a monitor in the configuration";
          }
        ];

      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$terminal" = "wezterm";
          "$fileManager" = "dolphin";
          "$menu" = "fuzzel";

          monitor = lib.lists.forEach cfg.monitors (m: m.port + ", " + m.config);

          env = [
            "XCURSOR_SIZE,28"
            "XCURSOR_THEME,phinger-cursors"
            "HYPRCURSOR_THEME,BreezeX-RosePine-Linux"
            "HYPRCURSOR_SIZE,28"
          ];

          exec-once = [
            "hypridle"
            "hyprlock"
            "hyprpaper"
            "dunst"
            "blueman-applet"
            "waybar"
            "hyprctl setcursor BreezeX-RosePine-Linux 28"
          ];
        };
      };
    }
  );
}
