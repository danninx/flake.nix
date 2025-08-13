{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    git
    gnumake
    wezterm
    wget
  ];
}
