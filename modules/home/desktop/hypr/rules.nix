{ config, lib, ... }:

{
  config = (
    lib.mkIf config.modules.hyprland.preset.enable {
      wayland.windowManager.hyprland.settings = {
        windowrulev2 = [
          # Picture-in-Picture
          "float, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"
          "move 100%-660 20, title:^(Picture-in-Picture)$"
          "size 640 360, title:^(Picture-in-Picture)$"

          # Network Manager Applet
          "float, class:^(nm-connection-editor)$"
          "pin, class:^(nm-connection-editor)$"
          "move 25% 25%, class:^(nm-connection-editor)$"
          "size 50% 50%, class:^(nm-connection-editor)$"

          # Bluetooth Manager Applet
          "float, class:^(.blueman-manager-wrapped)$"
          "pin, class:^(.blueman-manager-wrapped)$"
          "move 25% 25%, class:^(.blueman-manager-wrapped)$"
          "size 50% 50%, class:^(.blueman-manager-wrapped)$"

          # xdg portal file picker
          "float, class:^(xdg-desktop-portal-gtk)$, title:^(All Files)$"
          "float, class:^(xdg-desktop-portal-gtk)$, title:^(Open Files)$"
          "float, class:^(xdg-desktop-portal-gtk)$, title:^(Open Folder)$"
          "float, class:^(xdg-desktop-portal-gtk)$, title:^(Choose a folder)(.*)$"

          # pwvucontrol
          "float, class:^(com.saivert.pwvucontrol)$"
          "pin, class:^(com.saivert.pwvucontrol)$"
          "move 25% 25%, class:^(com.saivert.pwvucontrol)$"
          "size 50% 50%, class:^(com.saivert.pwvucontrol)$"
        ];
      };
    }
  );
}
