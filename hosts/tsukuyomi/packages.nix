{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    anki
    git
    gnumake
    wezterm
    wget
  ];
}
