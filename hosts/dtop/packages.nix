{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    git
    gnumake
    oh-my-posh
    wget
  ];
}
