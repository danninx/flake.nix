{ config, inputs, pkgs, ... }:

{
   users.users.danninx = {
      isNormalUser = true;
      description = "danninx";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      discord
      fastfetch
      flameshot
      git
      ];
   };
}
