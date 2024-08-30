{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    #
    # Some high-level settings:
    #
    workspace = {
      lookAndFeel = "nothing";
      cursor = {
        theme = "Future-dark-cursors";
        size = 24;
      };
      iconTheme = "Nordic-darker";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };

    # Add custom hotkeys commands
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Return";
      command = "konsole";
    };
    hotkeys.commands."launch-dolphin" = {
      name = "Launch Dolphin";
      key = "Meta+E";
      command = "dolphin";
    };    
    hotkeys.commands."launch-chrome" = {
      name = "Launch Chrome";
      key = "Meta+F";
      command = "google-chrome-stable";
    };
    hotkeys.commands."launch-vscode" = {
      name = "Launch VSCode";
      key = "Meta+C";
      command = "code";
    };  

    fonts = {
      general = {
        family = "JetBrains Mono";
        pointSize = 12;
      };
    };

    panels = [
      #BEGIN: Windows-like panel at the bottom
      {
        screen= 0;
        location = "bottom";
        alignment = "center";
        height = 44;
        floating = true;
        lengthMode = "fit";
        hiding = "autohide";
        widgets = [
          # Or you can configure the widgets by adding the widget-specific options for it.
          # See modules/widgets for supported widgets and options for these widgets.
          # For example:
          
          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:steam"
                "applications:google-chrome"
                "applications:spotify"
                "applications:code"
                "applications:smartcode-stremio"
                "applications:miru"
              ];
            };
          }
        ];
      }
      # END: Windows-like panel at the bottom
      
      #BEGIN: Application name, Global menu and Song information and playback controls at the top
      {
        screen= 0;
        location = "top";
        alignment = "center";
        height = 28;
        floating = true;
        lengthMode = "fill";
        hiding = "normalpanel";
        widgets = [
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            plasmusicToolbar = {
              panelIcon = {
                albumCover = {
                  useAsIcon = true; 
                  radius = 8;
                  fallbackToIcon = true;
                };
                icon = "view-media-track";
              };
              preferredSource = "spotify";
              musicControls.showPlaybackControls = false;
              songText = {
                displayInSeparateLines = false;
                maximumWidth = 640;
                scrolling = {
                  behavior = "alwaysScroll";
                  speed = 3;
                };
              };
            };
          }
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.notifications"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.networkmanagement"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "24h";
              date.enable = false;
            };
          }
        ];
      }
      # END: Application name, Global menu and Song information and playback controls at the top
    ];

    window-rules = [
      {
        description = "Spotify";
        match = {
          window-class = {
            value = "spotify";
            type = "exact"; 
          };
          window-types = [ "normal" ];
        };    
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
          # `apply` defaults to "apply-initially"
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 1000;
        };
        turnOffDisplay = {
          idleTimeout = 1000;
          idleTimeoutWhenLocked = "immediately";
        };
      };
      battery = {
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };

    kwin = {
      virtualDesktops = {
        number = 5;
        names = [ "1" "2" "3" "4" "5"];
      };
    };

    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };

    #
    # Some mid-level settings:
    #
    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Overview" = "Meta+W";
        "Grid View" = "Meta+G";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";    
        "Window One Screen to the Left" = "Meta+Shift+A";
        "Window Maximize" = "Meta+Shift+W";
        "Window Minimize" = "Meta+Shift+S";
        "Window Move Center" = "Meta+X"; 
        "Window Close" = "Meta+Q";
        "Kill Window" = "Meta+Ctrl+Q";
        "decrease_volume_small" ="Alt+-";
        "increase_volume_small" = "Alt+=";
        "previousmedia" = "Alt+1";
        "playpausemedia" = "Alt+2";
        "nextmedia" = "Alt+3";
      };
    };


    #
    # Some low-level settings:
    #
    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "SF";
      kwinrc.Desktops.Number = {
        value = 5;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        # To use nested groups use / as a separator. In the below example,
        # Provider will be added to [Greeter][Wallpaper][org.kde.potd][General].
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
    };
  };
}