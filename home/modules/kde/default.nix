{
  imports = [
    ./kscreenlocker.nix
    ./kwin.nix
    ./panels.nix
    ./shortcuts.nix
  ];

  programs.plasma.krunner.shortcuts.launch = "Meta+Shift+!";
}
