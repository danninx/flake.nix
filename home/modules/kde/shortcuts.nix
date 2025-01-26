{ ... }:

{
  programs.plasma = {
    enable = true;

    # auto generated shortcuts -- format these sometime
    shortcuts = {
      ksmserver = {
        "Lock Session" = "Meta+L";
      };

      kwin = {
        KrohnkiteFocusDown = "Meta+S";
        KrohnkiteFocusLeft = "Meta+A";
        KrohnkiteFocusRight = "Meta+D";
        KrohnkiteFocusUp = "Meta+W";
        KrohnkiteShiftDown = "none";
        KrohnkiteShiftLeft = "none";
        KrohnkiteShiftRight = "none";
        KrohnkiteShiftUp = "none";
        KrohnkiteToggleFloat = "Meta+Space";
        Overview = "none";

        "Switch One Desktop to the Left" = "Meta+J";
        "Switch One Desktop to the Right" = "Meta+K";

        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Switch to Desktop 9" = "Meta+9";

        "Walk Through Windows" = "Alt+Tab";
        "Window Close" = "Meta+Q";
        "Window Maximize" = "Meta+F";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Shift+J";
        "Window One Desktop to the Right" = "Meta+Shift+K";
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window Quick Tile Top" = "Meta+Up";

        "Window to Desktop 1" = "Meta+Shift+1";
        "Window to Desktop 2" = "Meta+Shift+2";
        "Window to Desktop 3" = "Meta+Shift+3";
        "Window to Desktop 4" = "Meta+Shift+4";
        "Window to Desktop 5" = "Meta+Shift+5";
        "Window to Desktop 6" = "Meta+Shift+6";
        "Window to Desktop 7" = "Meta+Shift+7";
        "Window to Desktop 8" = "Meta+Shift+8";
        "Window to Desktop 9" = "Meta+Shift+9";
      };

      plasmashell = {
        "Activate Application Launcher" = "none"; 
      };

      "services/Alacritty.desktop"."_launch" = "Meta+T";
      "services/net.local.fuzzel.desktop"."_launch" = "Meta";
    };
  };
}

