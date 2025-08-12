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
      protonvpn-gui
      python312
      qbittorrent
      remmina
      sioyek
      tor-browser-bundle-bin
      unzip
      vlc
      wireshark
      yazi

      ghc
      (haskell-language-server.override {
         supportedGhcVersions = [ "984" ];
      })
      stack
      haskellPackages.cabal-fmt
      haskellPackages.cabal-gild
    ] ++ [ 
      kdePackages.okular 
    ];

    shell = pkgs.zsh;
}
