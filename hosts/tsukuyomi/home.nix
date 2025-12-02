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
    hyprland = {
      preset.enable = true;
      monitors = [
        {
          port = "DP-1";
          config = "2560x1440@144.00, 0x0, 1";
          wallpaper = "$HOME/dnix/assets/images/kyriemocha.png";
        }
        {
          port = "HDMI-A-1";
          config = "1920x1080@60.00, -1080x-240, 1, transform, 1";
          wallpaper = null;
        }
      ];
      defaultMonitor = "DP-1";
    };
  };

  programs.home-manager.enable = true;
}
