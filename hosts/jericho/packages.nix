{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    code-cursor
    flameshot
    git
    gnumake
    wezterm
    wget
  ];
}
