{ pkgs, ... }:

{
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "dialout" "networkmanager" "wheel" "wireshark" ];
    packages = with pkgs; [
      air
      bun
      discord
      fuzzel
      libreoffice-qt
      hunspell
      lazygit
      nix-prefetch-git
      obsidian

      protonmail-desktop
      proton-pass
      protonvpn-gui

      python312
      qbittorrent
      remmina
      sioyek
      unzip
      vlc
      wireshark
    ];

    shell = pkgs.zsh;
}
