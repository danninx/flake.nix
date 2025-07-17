{ pkgs, ... }:

{
  # default *system* packages
  environment.systemPackages = with pkgs; [
    alacritty
    git
    gnumake
    wget
  ];
}
