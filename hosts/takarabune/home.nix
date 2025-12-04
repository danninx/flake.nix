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
  ];

  modules = {
    hyprland.preset.enable = true;
  };

  programs.hyprflake = {
    monitors = {
      "eDP-1" = {
        primary = true;
        resolution = { x = 1920; y = 1080; };
        refresh = 60;
        position = { x = 0; y = 0; };
        wallpaper = ../../assets/images/kyriemocha.png;
      };
    };
  };

  programs.home-manager.enable = true;
}
