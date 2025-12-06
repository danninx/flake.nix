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
      programs.hyprflake = {
        enable = true;
        defaultBackgroundColor = "rgb(242437)";

        workspaces = let
          numbered = num: {
            persistent = true; 
            open = {
              mods = ["SUPER"];
              key = num; 
            };
            moveWindow = {
              mods = ["SUPER" "SHIFT"];
              key = num; 
            };
          };

          withSuper = key: {
            mods = ["SUPER"];
            key = key;
          };

          withSuperShift = key: {
            mods = ["SUPER" "SHIFT"];
            key = key;
          };
        in {
          "1" = numbered "1";
          "2" = numbered "2";
          "3" = numbered "3";
          "4" = numbered "4";
          "5" = numbered "5";
          "6" = numbered "6";

          "code" = { 
            special = true; 
            gapsIn = 0;
            gapsOut = 0;
            border = false;
            rounding = false;
            decorate = false;
            shadow = false;
            open = withSuper "C";
            moveWindow = withSuperShift "C";
          };
          "discord" = { 
            special = true; 
            open = withSuper "D";
            moveWindow = withSuperShift "D";
          };
          "games" = { special = true; 
            open = withSuper "E";
            moveWindow = withSuperShift "E";
          };
          "reading" = { 
            special = true; 
            gapsIn = 0;
            gapsOut = 0;
            border = false;
            rounding = false;
            decorate = false;
            shadow = false;
            open = withSuper "R";
            moveWindow = withSuperShift "R";
          };
        };
      };

      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$terminal" = "wezterm";
          "$fileManager" = "dolphin";
          "$menu" = "fuzzel";

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

          windowrulev2 = [
            "float, onworkspace:f[special:games]"
            "tile, onworkspace:f[special:games], initialTitle:^(Steam)$"
          ];

          windowrule = [ 
            "workspace special:games silent, class:steam"
            "workspace discord, class:discord"
            "workspace reading, class:Keybase" 
          ];
        };
      };
    }
      );
    }
