{ pkgs, ... }:
{

  programs.plasma = {
    enable = true;
    input.keyboard.numlockOnStartup = "on";

    #BEGIN: Theme settings
    workspace = {
      lookAndFeel = "catppuccin-kde";
      cursor = {  
        theme = "Future-dark-cursors";
        size = 24;
      };
      wallpaper = "/home/gambled/Pictures/Wallpapers/PC/anime/4F4535475957314D5955566D65464E0A.jpg";
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
                #"applications:org.kde.dolphin.desktop"
                "applications:steam.desktop"
                #"applications:google-chrome.desktop"
                "applications:miru.desktop"
                "applications:code.desktop"
                "applications:dbeaver.desktop"
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
    #END: Panels


    #BEGIN: Window rules
    window-rules = [
      {
        description = "Spotify";
        match = {
          window-class = {
            value = "Spotify";
            type = "exact"; 
            match-whole = false;
          };
          window-types = [ "normal" ];
        };    
        apply = {
          closeable = {
            value = false;
            apply = "force";
          };
          desktops = {
            value = "c563d948-dbdd-4892-8c28-c46fe1984617"; # Desktop 6
          };
          noborder = {      
            value = true;
            apply = "force";
          };
          screen = {
            value = "0";
            apply = "force";
          };
          size = {
            value = "1920,1052";
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
          closeable = {
            value = false;
            apply = "force";
          };
          desktops = {
            value = "fd3ca781-65eb-4a38-90ab-21f420dc4236"; # desktop 2
          };
          noborder = {      
            value = true;
            apply = "force";
          };
          screen = {
            value = "0";
          };
          size = {
            value = "1920,1052";
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
            value = "fd3ca781-65eb-4a38-90ab-21f420dc4236"; # desktop 2
          };
          screen = {
            value = "0";
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
            value = "01625988-f599-4fd8-abbe-3edc85738e10"; # desktop 4
          };
          screen = {
            value = "1";
          };
        };
      }
      
    ];
    #END: Window rules


    #BEGIN: Power management
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
    #END: Power management


    # Virtual desktops
    kwin = {
      virtualDesktops = {
        rows = 2;
        number = 6;
        names = [ "1" "2" "3" "4" "5" "6"];
      };
    };
    
    # Screen locker
    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };

    # Spectacle
    spectacle.shortcuts = {
      captureRectangularRegion = "Print";
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
      "services.org.kde.krunner.desktop" = {
        "_launch" = "Meta";
      };
      "services.code.desktop" = {
        "_launch" = "Meta+C";
      };
      "services.org.kde.konsole.desktop" = {
        "_launch" = "Meta+Return";
      };
      "services.google-chrome.desktop" = {
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
        # To use nested groups use / as a separator. In the below example,
        # Provider will be added to [Greeter][Wallpaper][org.kde.potd][General].
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
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
    Keywords=discord;vencord;electron;chat
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