{ ... }:

{
  programs.plasma.panels = [
    # Top bar
    {
      alignment = "center";
      floating = false;
      height = 20;
      hiding = "none";
      lengthMode = "fill";
      location = "top";
      screen = "all";
      widgets = [
      {
      name = "org.dhruv8sh.kara";
      config = {
      general = {
      animationDuration = 200;
      highlightType = 3;
      spacing = 0;
      type = 1;
      };
      type2 = {
      fixedLen = 8;
      labelSource = 0;
      template = "%d";
      };
      };
      }
      {
      panelSpacer = {
      expanding = true;
      };
      }
      {
      digitalClock = {
      calendar = {
      firstDayOfWeek = "sunday";
      plugins = [
      "astronomicalevents"
      "holidaysevents"
      ];
      showWeekNumbers = true;
      };
      date = {
      enable = false;
      format = "shortDate";
                  position = "belowTime";
                };
                font = {
                  bold = false;
                  family = "Inter";
                  italic = false;
                  size = 9;
                  weight = 300;
                };
                time = {
                  format = "24h";
                  showSeconds = "onlyInTooltip";
                };
                timeZone = {
                  alwaysShow = false;
                  changeOnScroll = false;
                  lastSelected = "America/Chicago";
                  selected = [
                    "America/Chicago"
                    "UTC"
                  ];
                };
              };
            }
            {
              panelSpacer = {
                expanding = true;
              };
            }
            {
              systemTray = {
                icons = {
                  scaleToFit = true;
                  spacing = "small";
                };
                pin = false;
              };
            }
          ];
        }
      ];
    }
