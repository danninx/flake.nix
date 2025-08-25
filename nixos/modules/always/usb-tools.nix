{ pkgs, ... }:

# tools for automounting usbs; pair with udiskie home module
{
  services.udisks2.enable = true;
  environment.systemPackages = [ pkgs.kdePackages.dolphin ];
}
