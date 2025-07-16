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
      go
      libreoffice-qt
      hunspell
      lazygit
      nix-prefetch-git
      obsidian
<<<<<<< HEAD
=======
      proton-pass
      python312
>>>>>>> 5435443 (create jericho)
      qbittorrent
      remmina
      sioyek
<<<<<<< HEAD
    ] ++ defaultPkgs ++ userPkgs;
=======
      tim
      unzip
      vlc
      wireshark
    ];
>>>>>>> 5435443 (create jericho)

    shell = pkgs.zsh;
}
