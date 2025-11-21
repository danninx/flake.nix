{ pkgs, ... }:

{
  services.globalprotect.enable = true;

  environment.systemPackages = with pkgs; [
    mysql-workbench
    globalprotect-openconnect
  ]; 
}
