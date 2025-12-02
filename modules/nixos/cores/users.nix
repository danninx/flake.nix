{ pkgs, ... }:

{
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [
      "dialout"
      "networkmanager"
      "wheel"
      "wireshark"
    ];
    packages = with pkgs; [
      discord
      fuzzel
      nix-prefetch-git
      obsidian
      openvpn
      postman
      proton-pass
      protonvpn-gui
      qbittorrent
      remmina
      unzip
      vlc
      wireshark
    ];

    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
