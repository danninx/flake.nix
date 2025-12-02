{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.hyprland;
in
{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "installation of hyprland desktop tools";
    modules.hyprland.defaultSession = lib.mkEnableOption "hyprland as the default DM session";
    modules.hyprland.user = lib.mkOption {
      type = lib.types.str;
      default = "danninx";
      description = "user for defaultSession";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      environment = {
        sessionVariables = {
          AQ_DRM_DEVICES = "/dev/dri/card1";
          NIXOS_OZONE_WL = "1";
        };

        systemPackages = with pkgs; [
          dunst
          hypridle
          hyprlock
          hyprpaper
          hyprshot
          jq
          libnotify
          networkmanagerapplet
          pwvucontrol
          rose-pine-cursor
          swappy
          waybar
          wl-clipboard
        ];
      };

      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      security.pam.services.hyprlock = { };

      xdg.portal.enable = true;
      xdg.portal.extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    })

    (lib.mkIf cfg.defaultSession {
      services.displayManager = {
        autoLogin = {
          enable = true;
          user = cfg.user;
        };

        defaultSession = "hyprland";
      };
    })
  ];
}
