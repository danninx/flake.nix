{ config, lib, ... }:

{
  config = (
    lib.mkIf config.modules.hyprland.preset.enable {
      wayland.windowManager.hyprland.settings = {
        windowrule = [
          # Picture-in-Picture
          "float 1, match:title ^(Picture-in-Picture)$"
          "pin 1, match:title ^(Picture-in-Picture)$"
          "move 100%-660 20, match:title ^(Picture-in-Picture)$"
          "size 640 360, match:title ^(Picture-in-Picture)$"

          # Network Manager Applet
          "float 1, match:class ^(nm-connection-editor)$"
          "pin 1, match:class ^(nm-connection-editor)$"
          "move 25% 25%, match:class ^(nm-connection-editor)$"
          "size 50% 50%, match:class ^(nm-connection-editor)$"

          # Bluetooth Manager Applet
          "float 1, match:class ^(\\.blueman-manager-wrapped)$"
          "pin 1, match:class ^(\\.blueman-manager-wrapped)$"
          "move 25% 25%, match:class ^(\\.blueman-manager-wrapped)$"
          "size 50% 50%, match:class ^(\\.blueman-manager-wrapped)$"

          # xdg portal file picker
          "float 1, match:class ^(xdg-desktop-portal-gtk)$, match:title ^(All Files)$"
          "float 1, match:class ^(xdg-desktop-portal-gtk)$, match:title ^(Open Files)$"
          "float 1, match:class ^(xdg-desktop-portal-gtk)$, match:title ^(Open Folder)$"
          "float 1, match:class ^(xdg-desktop-portal-gtk)$, match:title ^(Choose a folder)(.*)$"

          # pwvucontrol
          "float 1, match:class ^(com.saivert.pwvucontrol)$"
          "pin 1, match:class ^(com.saivert.pwvucontrol)$"
          "move 25% 25%, match:class ^(com.saivert.pwvucontrol)$"
          "size 50% 50%, match:class ^(com.saivert.pwvucontrol)$"

          "match:class ^(steam_app_.*)$, idle_inhibit focus"
        ];
      };
    }
  );
}
