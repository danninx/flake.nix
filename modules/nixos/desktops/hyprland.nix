{ inputs, mkEnableable, pkgs, ... }:

mkEnableable "installation of hyprland and associated tools/packages" {
  hyprland = {
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
        ddcutil
        dunst
        hypridle
        hyprlock
        hyprpaper
        hyprpicker
        hyprshot
        jq
        libnotify
        networkmanagerapplet
        pwvucontrol
        rose-pine-cursor
        socat
        swappy
        waybar
        wl-clipboard
      ] ++ [ inputs.quickshell.packages.x86_64-linux.default ];
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    security.pam.services.hyprlock = { };

    xdg.portal.enable = true;
    xdg.portal.extraPortals =  with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "danninx";
    };

    defaultSession = "hyprland";
  };
}
