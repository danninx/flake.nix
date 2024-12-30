{ config, inputs, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      discord
      flameshot
      git
    ];
    shell = pkgs.zsh;
  };
}
