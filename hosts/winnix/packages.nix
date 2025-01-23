{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    gnumake
  ];
}
