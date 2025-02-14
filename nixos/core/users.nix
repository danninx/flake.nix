{ pkgs, ... }:

{
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [
      discord
      flameshot
      git
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
