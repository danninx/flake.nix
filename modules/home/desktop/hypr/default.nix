{ config, lib, ... }:

{
  imports = [
    ./bindings.nix
    ./general.nix
    ./rules.nix
    ./workspaces.nix

    ./ecosystem
  ];

  options = {
    modules.hyprland.preset.enable = lib.mkEnableOption "hyprland pre-configuration";
  };

  config = (lib.mkIf config.modules.hyprland.preset.enable {
    wayland.windowManager.hyprland.settings = {
      "$terminal" = "wezterm";
      "$fileManager" = "dolphin";

      monitor = [
        ",preferred,auto,auto"
      ];

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
  }); 
}
