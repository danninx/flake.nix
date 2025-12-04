{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.atkynson-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono

    protonmail-desktop
  ];

  modules = {
    hyprland.preset.enable = true;
  };

  programs.hyprflake = {
    monitors = {
      "DP-1" = {
        primary = true;
        resolution = { x = 2560; y = 1440; };
        refresh = 144;
        position = { x = 0; y = 0; };
        wallpaper = ../../assets/images/kyriemocha.png;
      };

      "HDMI-A-1" = {
        resolution = { x = 1920; y = 1080; };
        position = { x = -1080; y = -240; };
        transform = 1;
      };
    };

    workspaces = {
      "code".monitor = "HDMI-A-1";
      "discord".monitor = "HDMI-A-1";
      "reading".monitor = "HDMI-A-1";
    };
  };

  programs.home-manager.enable = true;
  
}
