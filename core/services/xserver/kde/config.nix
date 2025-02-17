{ pkgs, ... }:
let
  elias = "joto";
in
{
  programs.plasma = {
    enable = true;
    input.keyboard.numlockOnStartup = "on";

    #BEGIN: Theme settings
    workspace = {
      enableMiddleClickPaste = true;
      clickItemTo = "select";
      iconTheme = "Gruvbox";
      colorScheme = "Gruvboxdarkmedium";
      splashScreen.theme = "GruvboxHexagon3";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "__aurorae__svg__Utterly-Round-Dark";
      };
    };

    fonts = {
      general = {
        family = "JetBrains Mono";
        pointSize = 12;
      };
    };
    #END: Theme settings


    #BEGIN: Panels
    panels = [
      #BEGIN: Windows-like panel at the bottom
      {
        screen= 0;
        location = "bottom";
        alignment = "center";
        height = 44;
        floating = true;
        lengthMode = "fit";
        hiding = "dodgewindows";
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
                #"applications:org.kde.dolphin.desktop"
                "applications:steam.desktop"
                #"applications:google-chrome.desktop"
                "applications:miru.desktop"
                "applications:code.desktop"
                "applications:dbeaver.desktop"
                "applications:stremio.desktop"
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
              #preferredSource = "spotify";
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
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.notifications"
              ];
              # And explicitly hide networkmanagement
              hidden = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.battery"
                "org.kde.plasma.mediaplayer"
                "Stremio"
                "sunshine-server"
                "ZapZap"
                "Nextcloud"
                "polychromatic-tray-applet"
                "Vesktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
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

      # Begin: Desktop pager at the bottom right
      {
        screen= 0;
        location = "bottom";
        alignment = "right";
        height = 44;
        floating = true;
        lengthMode = "fit";
        hiding = "dodgewindows";
        widgets = [
          "org.kde.plasma.pager"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.showdesktop"
        ];
      }
      # End: Desktop pager at the bottom right
    ];
    #END: Panels

    #BEGIN: Desktop widgets
    desktop.widgets = [
      {
        config = {
          Appearance = {
            showDate = false;
          };
        };
        name = "org.kde.plasma.digitalclock";
        position = {
          horizontal = 51;
          vertical = 100;
        };
        size = {
          height = 250;
          width = 250;
        };
      }
      {
        plasmusicToolbar = {
          background = "transparentShadow";
          position = {
            horizontal = 50;
            vertical = 300;
          };
          size = {
            height = 400;
            width = 250;
          };
        };
      }
      {
        name = "org.kde.kdeconnect";
        position = {
          horizontal = 1200;
          vertical = 10;
        };
        size = {
          height = 500;
          width = 1000;
        };
      }
      {
        name = "org.kde.plasma.bluetooth";
        position = {
          horizontal = 500;
          vertical = 10;
        };
        size = {
          height = 350;
          width = 400;
        };
      }
    ];
    #END: Desktop widgets

    #BEGIN: Screenlocker
    kscreenlocker = {
      appearance = {
        alwaysShowClock = true;
        showMediaControls = true;
      };
      autoLock = false;
      lockOnResume = false;
      lockOnStartup = false;
      passwordRequired = false;
      passwordRequiredDelay = 900; # Tiempo en segundos para que se requiera la contraseña
      timeout = 10; # Tiempo en minutos para que se bloquee la pantalla
    };
    #END: Screenlocker

    #BEGIN: Window rules
    window-rules = [
      {
        description = "Spotify";
        match = {
          machine.type = "exact";
          machine.value = "gambled";
          window-class = {
            value = "Spotify";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_6";
            apply = "force";
          };
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "Vesktop";
        match = {
          window-class = {
            value = "vesktop";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_2";
            apply = "force";
          };
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "ZapZap";
        match = {
          window-class = {
            value = "com.rtosta.zapzap";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_2";
            apply = "force";
          };
        };
      }

      {
        description = "Steam";
        match = {
          window-class = {
            value = "steam";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_4";
            apply = "force";
          };
        };
      }

      {
        description = "Stremio";
        match = {
          window-class = {
            value = "com.stremio.stremio";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_5";
          };
        };
      }

      {
        description = "Miru";
        match = {
          window-class = {
            value = "Miru";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_5";
          };
        };
      }

      {
        description = "Steam Big Picture";
        match = {
          window-class = {
            value = "gamescope";
            type = "exact";
            match-whole = false;
          };
          window-types = [ "normal" ];
        };
        apply = {
          desktops = {
            value = "Desktop_4";
            apply = "force";
          };
          fullscreen = {
            value = true;
            apply = "force";
          };
        };
      }
    ];
    #END: Window rules


    #BEGIN: Power management
    powerdevil = {
      AC = {
        autoSuspend = {
          action = "nothing";
          # idleTimeout = 900; # 15 minutes
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 600;
        };
        turnOffDisplay = {
          idleTimeout = 800;
        };
        powerButtonAction = "shutDown";
        powerProfile = "performance";

        inhibitLidActionWhenExternalMonitorConnected = true; # que nombresote qpd
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };

      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600; # 15 minutes
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 420;
        };
        turnOffDisplay = {
          idleTimeout = 500;
        };
        powerButtonAction = "shutDown";
        powerProfile = "balanced";

        inhibitLidActionWhenExternalMonitorConnected = true;
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "hybridSleep";
      };

      lowBattery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600; # 15 minutes
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 300;
        };
        turnOffDisplay = {
          idleTimeout = 500;
        };
        powerButtonAction = "shutDown";
        powerProfile = "powerSaving";

        inhibitLidActionWhenExternalMonitorConnected = false;
        whenLaptopLidClosed = "hibernate";
        whenSleepingEnter = "hybridSleep";
      };
    };
    #END: Power management


    # Virtual desktops
    kwin = {
      virtualDesktops = {
        rows = 2;
        number = 6;
        names = [ "Desktop_1" "Desktop_2" "Desktop_3" "Desktop_4" "Desktop_5" "Desktop_6"];
      };
      cornerBarrier = false;
      edgeBarrier = 0;
      effects = {
        blur = {
          enable = true;
          noiseStrength = 14;
          strength = 15;
        };
        dimAdminMode.enable = true;
        dimInactive.enable = false;
      };
    };

    # Spectacle
    spectacle.shortcuts = {
      captureRectangularRegion = "Print";
    };

    # Krunner
    krunner = {
      historyBehavior = "enableSuggestions";
      position = "center";
      shortcuts.launch = "Meta";

    };


    #BEGIN: Shortcuts
    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      };
      kwin = {
        "Expose" = "Meta+,";
        "Overview" = "Meta+W";
        "Grid View" = "Meta+G";
        "Switch to Desktop 1" = "Meta+U";
        "Switch to Desktop 2" = "Meta+I";
        "Switch to Desktop 3" = "Meta+O";
        "Switch to Desktop 4" = "Meta+J";
        "Switch to Desktop 5" = "Meta+K";
        "Switch to Desktop 6" = "Meta+L";
        "Window to Desktop 1" = "Meta+Shift+U";
        "Window to Desktop 2" = "Meta+Shift+I";
        "Window to Desktop 3" = "Meta+Shift+O";
        "Window to Desktop 4" = "Meta+Shift+J";
        "Window to Desktop 5" = "Meta+Shift+K";
        "Window to Desktop 6" = "Meta+Shift+L";
        "Window One Screen to the Left" = "Meta+Shift+A";
        "Window Maximize" = "Meta+Shift+W";
        "Window Minimize" = "Meta+Shift+S";
        "Window Move Center" = "Meta+X";
        "Window Resize" = "Meta+R";
        "Window Close" = "Meta+Q";
        "Kill Window" = "Meta+Ctrl+Q";
      };
      mediacontrol = {
        "previousmedia" = "Alt+1";
        "playpausemedia" = "Alt+2";
        "nextmedia" = "Alt+3";
      };
      kmix = {
        "decrease_volume_small" = "Alt+-";
        "increase_volume_small" = "Alt+=";
      };
      "services.code.desktop" = {
        "_launch" = "Meta+C";
      };
      "services.org.kde.konsole.desktop" = {
        "_launch" = "Meta+Return";
      };
      "google-chrome.desktop" = {
        "_launch" = "Meta+F";
      };
    };
    #END: Shortcuts

    #BEGIN low level settings
    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      # Focus follows mouse
      kwinrc."Windows".CenterSnapZone = 10;
      kwinrc."Windows".DelayFocusInterval = 0;
      kwinrc."Windows".FocusPolicy = "FocusFollowsMouse";
      kwinrc."Windows".NextFocusPrefersMouse = true;
      # Windows decorations
      kwinrc."org.kde.kdecoration2".BorderSize = "None";
      kwinrc."org.kde.kdecoration2".BorderSizeAuto = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "BF";
      kwinrc."org.kde.kdecoration2".ButtonsOnRight = "IAX";

      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        appearance.alwaysShowClock = true;
        appearance.showMediaControls = true;
        # To use nested groups use / as a separator. In the below example,
        # Provider will be added to [Greeter][Wallpaper][org.kde.potd][General].
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };

      # Night color
      "kwinrc"."NightColor"."Active" = true;
      "kwinrc"."NightColor"."LatitudeFixed" = 19.923664122137396;
      "kwinrc"."NightColor"."LongitudeFixed" = "-101.50375939849624";
      "kwinrc"."NightColor"."Mode" = "Location";
      "kwinrc"."NightColor"."NightTemperature" = 3700;
    };
    #END low level settings
  };

  # BEGIN: Autostart apps
  home.file.".config/autostart/spotify.desktop".text = ''
    [Desktop Entry]
    Categories=Audio;Music;Player;AudioVideo;
    Exec=spotify %U
    GenericName=Music Player
    Icon=spotify-client
    MimeType=x-scheme-handler/spotify;
    Name=Spotify
    StartupWMClass=spotify
    Terminal=false
    TryExec=spotify
    Type=Application
  '';

  home.file.".config/autostart/steam.desktop".text = ''
    [Desktop Action BigPicture]
    Exec=steam steam://open/bigpicture
    Name=Big Picture

    [Desktop Action Community]
    Exec=steam steam://url/SteamIDControlPage
    Name=Community

    [Desktop Action Friends]
    Exec=steam steam://open/friends
    Name=Friends

    [Desktop Action Library]
    Exec=steam steam://open/games
    Name=Library

    [Desktop Action News]
    Exec=steam steam://open/news
    Name=News

    [Desktop Action Screenshots]
    Exec=steam steam://open/screenshots
    Name=Screenshots

    [Desktop Action Servers]
    Exec=steam steam://open/servers
    Name=Servers

    [Desktop Action Settings]
    Exec=steam steam://open/settings
    Name=Settings

    [Desktop Action Store]
    Exec=steam steam://store
    Name=Store

    [Desktop Entry]
    Actions=Store;Community;Library;Servers;Screenshots;News;Settings;BigPicture;Friends;
    Categories=Network;FileTransfer;Game;
    Comment=Application for managing and playing games on Steam
    Exec=steam %U
    Icon=steam
    MimeType=x-scheme-handler/steam;x-scheme-handler/steamlink;
    Name=Steam
    PrefersNonDefaultGPU=true
    Terminal=false
    Type=Application
    X-KDE-RunOnDiscreteGpu=true
  '';

  home.file.".config/autostart/vesktop.desktop".text = ''
    [Desktop Entry]
    Categories=Network;InstantMessaging;Chat
    Exec=vesktop %U
    GenericName=Internet Messenger
    Icon=vesktop
    Keywords=vesktop;vencord;electron;chat
    Name=Vesktop
    StartupWMClass=Vesktop
    Type=Application
    Version=1.4
  '';
  # END: Autostart apps



  #BEGIN: Konsole theme
  programs.konsole = {
    profiles.konsole.defaultProfile = "catpucchin";
    profiles.catppuccin.colorscheme = "catppuccin-frappe";
  };
  home.file.".local/share/konsole/catppuccin-frappe.colorscheme".text = ''
    [Background]
    Color=48,52,70

    [BackgroundFaint]
    Color=48,52,70

    [BackgroundIntense]
    Color=48,52,70

    [Color0]
    Color=115,121,148

    [Color0Faint]
    Color=115,121,148

    [Color0Intense]
    Color=115,121,148

    [Color1]
    Color=231,130,132

    [Color1Faint]
    Color=231,130,132

    [Color1Intense]
    Color=231,130,132

    [Color2]
    Color=166,209,137

    [Color2Faint]
    Color=166,209,137

    [Color2Intense]
    Color=166,209,137

    [Color3]
    Color=229,200,144

    [Color3Faint]
    Color=229,200,144

    [Color3Intense]
    Color=229,200,144

    [Color4]
    Color=140,170,238

    [Color4Faint]
    Color=140,170,238

    [Color4Intense]
    Color=140,170,238

    [Color5]
    Color=202,158,230

    [Color5Faint]
    Color=202,158,230

    [Color5Intense]
    Color=202,158,230

    [Color6]
    Color=153,209,219

    [Color6Faint]
    Color=153,209,219

    [Color6Intense]
    Color=153,209,219

    [Color7]
    Color=198,208,245

    [Color7Faint]
    Color=198,208,245

    [Color7Intense]
    Color=198,208,245

    [Foreground]
    Color=198,208,245

    [ForegroundFaint]
    Color=198,208,245

    [ForegroundIntense]
    Color=198,208,245

    [General]
    Blur=false
    ColorRandomization=false
    Description=Catppuccin Frappé
    Opacity=1
    Wallpaper=
  '';
  #END: Konsole theme
}
