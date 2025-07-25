{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    code-cursor
    git
    gnumake
    wezterm
    wget
  ];
}
