{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.atkynson-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
  ];
}
