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
      proton-pass
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
