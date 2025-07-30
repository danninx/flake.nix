{ pkgs, ... }:

let
  alwaysOn = ../../home/modules/always;
in
{
  imports = [
    alwaysOn
    ../../home/modules/optional/fuzzel.nix
    ../../home/modules/optional/firefox.nix
    ../../home/modules/optional/stylix.nix
    ../../home/modules/optional/vscode.nix
    ../../home/modules/optional/yazi.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.home-manager.enable = true;
}
