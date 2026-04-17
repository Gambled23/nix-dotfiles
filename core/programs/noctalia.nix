# Home manager file
{ lib, inputs, pkgs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  programs.noctalia-shell = {
    systemd.enable = true;
    enable = true;
    package = (inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override { calendarSupport = true; });
    colors = lib.mkForce {
      mPrimary = "#b8bb26";
      mOnPrimary = "#282828";
      mSecondary = "#fabd2f";
      mOnSecondary = "#282828";
      mTertiary = "#83a598";
      mOnTertiary = "#282828";
      mError = "#fb4934";
      mOnError = "#282828";
      mSurface = "#282828";
      mOnSurface = "#fbf1c7";
      mSurfaceVariant = "#3c3836";
      mOnSurfaceVariant = "#ebdbb2";
      mOutline = "#57514e";
      mShadow = "#282828";
      mHover = "#83a598";
      mOnHover = "#282828";
      terminal = {
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
        foreground = "#ebdbb2";
        background = "#282828";
        selectionFg = "#ebdbb2";
        selectionBg = "#665c54";
        cursorText = "#282828";
        cursor = "#ebdbb2";
      };
    };
    settings = lib.mkForce {
      settingsVersion = 59;

      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        density = "comfortable";
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        enableClipboardChips = true;
        enableClipboardSmartIcons = true;
        sortByMostUsed = true;
        terminalCommand = "ghostty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableSessionSearch = true;
        enableWindowsSearch = true;
        overviewLayer = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        visualizerType = "wave";
        mprisBlacklist = [ ];
        preferredPlayer = "Spotify";
        volumeFeedback = true;
        spectrumFrameRate = 30;
        volumeFeedbackSoundFile = "/etc/nixos/core/services/xserver/hyprland/volume.mp3";
        spectrumMirrored = true;
      };

      bar = {
        autoHideDelay = 500;
        autoShowDelay = 150;
        capsuleColorKey = "none";
        contentPadding = 2;
        barType = "framed";
        enableExclusionZoneInset = true;
        position = "top";
        monitors = [
          "eDP-1"
          "DP-3"
          "HDMI-A-1"
          "sunshine"
        ];
        mouseWheelAction = "none";
        mouseWheelWrap = true;
        reverseScroll = false;
        rightClickAction = "controlCenter";
        rightClickCommand = "";
        rightClickFollowMouse = true;
        showOnWorkspaceSwitch = true;
        widgetSpacing = 6;
        density = "comfortable";
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 1;
        backgroundOpacity = 0.6;
        useSeparateOpacity = false;
        marginVertical = 4;
        marginHorizontal = 4;
        frameThickness = 4;
        frameRadius = 4;
        outerCorners = false;
        displayMode = "always_visible";
        fontScale = 1;
        middleClickAction = "none";
        middleClickCommand = "";
        middleClickFollowMouse = false;
        hideOnOverview = false;

        #Widgets per screen
        screenOverrides = [
          {
            enabled = true;
            name = "HDMI-A-1";
            widgets = {
              left = [
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
                }
                # {
                #   defaultSettings = {
                #     enableTodoIntegration = true;
                #     notecardsEnabled = true;
                #     pincardsEnabled = true;
                #     position = "Bottom";
                #     showCloseButton = false;
                #   };
                #   id = "plugin:clipper";
                # }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.6;
                  id = "Workspace";
                  labelMode = "index";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  fontWeight = "bold";
                  showApplications = true;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = false;
                  unfocusedIconsOpacity = 1;
                  showApplicationsHover = false;
                }
                {
                  defaultSettings = {
                    borderRadius = 1;
                    expandDirection = "left";
                    focusBorderColor = "primary";
                    mainIcon = "layout-grid";
                    primaryPillColor = "none";
                    primaryShowPill = false;
                    primarySize = 0.9;
                    primarySymbolColor = "none";
                    secondaryPillColor = "primary";
                    secondaryShowPill = true;
                    secondarySize = 0.9;
                    secondarySymbolColor = "none";
                    workspaces = [
                      {
                        icon = "letter-a";
                        name = "A";
                      }
                      {
                        icon = "letter-s";
                        name = "S";
                      }
                      {
                        icon = "letter-d";
                        name = "D";
                      }
                    ];
                  };
                  id = "plugin:special-workspaces";
                }

              ];
              center = [
                {
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  compactMode = true;
                  hideMode = "hidden";
                  hideWhenIdle = false;
                  id = "MediaMini";
                  maxWidth = 300;
                  panelShowAlbumArt = true;
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showArtistFirst = false;
                  showProgressRing = true;
                  showVisualizer = true;
                  useFixedWidth = false;
                  visualizerType = "linear";
                  textColor = "none";
                }
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  commandPrefix = "ssh";
                  defaultSettings = {
                    pollInterval = 10;
                    showInactiveHosts = true;
                    terminalCommand = "";
                  };
                  id = "plugin:ssh-sessions";
                }
                {
                  defaultSettings = {
                    autoMount = true;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "none";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
                }
                {
                  defaultSettings = {
                  activeColor = "primary";
                  enableToast = true;
                  hideInactive = true;
                  iconSpacing = 4;
                  inactiveColor = "none";
                  micFilterRegex = "";
                  removeMargins = false;
                  };
                  id = "plugin:privacy-indicator";
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-hover";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "onhover";
                  iconColor = "none";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
                }
                {
                  hideWhenZero = true;
                  hideWhenZeroUnread = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                  iconColor = "none";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          }
          {
            enabled = true;
            name = "eDP-1";
            widgets = {
              left = [
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
                }
                # {
                #   defaultSettings = {
                #     enableTodoIntegration = true;
                #     notecardsEnabled = true;
                #     pincardsEnabled = true;
                #     position = "Bottom";
                #     showCloseButton = false;
                #   };
                #   id = "plugin:clipper";
                # }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.6;
                  id = "Workspace";
                  labelMode = "index";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  fontWeight = "bold";
                  showApplications = true;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = false;
                  unfocusedIconsOpacity = 1;
                  showApplicationsHover = false;
                }
                {
                  defaultSettings = {
                    borderRadius = 1;
                    expandDirection = "left";
                    focusBorderColor = "primary";
                    mainIcon = "layout-grid";
                    primaryPillColor = "none";
                    primaryShowPill = false;
                    primarySize = 0.9;
                    primarySymbolColor = "none";
                    secondaryPillColor = "primary";
                    secondaryShowPill = true;
                    secondarySize = 0.9;
                    secondarySymbolColor = "none";
                    workspaces = [
                      {
                        icon = "letter-a";
                        name = "A";
                      }
                      {
                        icon = "letter-s";
                        name = "S";
                      }
                      {
                        icon = "letter-d";
                        name = "D";
                      }
                    ];
                  };
                  id = "plugin:special-workspaces";
                }

              ];
              center = [
                {
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  compactMode = true;
                  hideMode = "hidden";
                  hideWhenIdle = false;
                  id = "MediaMini";
                  maxWidth = 300;
                  panelShowAlbumArt = true;
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showArtistFirst = false;
                  showProgressRing = true;
                  showVisualizer = true;
                  useFixedWidth = false;
                  visualizerType = "linear";
                  textColor = "none";
                }
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  commandPrefix = "ssh";
                  defaultSettings = {
                    pollInterval = 10;
                    showInactiveHosts = true;
                    terminalCommand = "";
                  };
                  id = "plugin:ssh-sessions";
                }
                {
                  defaultSettings = {
                    autoMount = true;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "none";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
                }
                {
                  defaultSettings = {
                  activeColor = "primary";
                  enableToast = true;
                  hideInactive = true;
                  iconSpacing = 4;
                  inactiveColor = "none";
                  micFilterRegex = "";
                  removeMargins = false;
                  };
                  id = "plugin:privacy-indicator";
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-hover";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "onhover";
                  iconColor = "none";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
                }
                {
                  hideWhenZero = true;
                  hideWhenZeroUnread = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                  iconColor = "none";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          }
          {
            enabled = true;
            name = "DP-3";
            widgets = {
              left = [
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
                }
                # {
                #   defaultSettings = {
                #     enableTodoIntegration = true;
                #     notecardsEnabled = true;
                #     pincardsEnabled = true;
                #     position = "Bottom";
                #     showCloseButton = false;
                #   };
                #   id = "plugin:clipper";
                # }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.6;
                  id = "Workspace";
                  labelMode = "index";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  fontWeight = "bold";
                  showApplications = true;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = false;
                  unfocusedIconsOpacity = 1;
                  showApplicationsHover = false;
                }
                {
                  defaultSettings = {
                    borderRadius = 1;
                    expandDirection = "left";
                    focusBorderColor = "primary";
                    mainIcon = "layout-grid";
                    primaryPillColor = "none";
                    primaryShowPill = false;
                    primarySize = 0.9;
                    primarySymbolColor = "none";
                    secondaryPillColor = "primary";
                    secondaryShowPill = true;
                    secondarySize = 0.9;
                    secondarySymbolColor = "none";
                    workspaces = [
                      {
                        icon = "letter-a";
                        name = "A";
                      }
                      {
                        icon = "letter-s";
                        name = "S";
                      }
                      {
                        icon = "letter-d";
                        name = "D";
                      }
                    ];
                  };
                  id = "plugin:special-workspaces";
                }

              ];
              center = [
                {
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  compactMode = true;
                  hideMode = "hidden";
                  hideWhenIdle = false;
                  id = "MediaMini";
                  maxWidth = 300;
                  panelShowAlbumArt = true;
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showArtistFirst = false;
                  showProgressRing = true;
                  showVisualizer = true;
                  useFixedWidth = false;
                  visualizerType = "linear";
                  textColor = "none";
                }
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  defaultSettings = {
                    autoMount = true;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "none";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
                }
                {
                  defaultSettings = {
                  activeColor = "primary";
                  enableToast = true;
                  hideInactive = true;
                  iconSpacing = 4;
                  inactiveColor = "none";
                  micFilterRegex = "";
                  removeMargins = false;
                  };
                  id = "plugin:privacy-indicator";
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-hover";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "onhover";
                  iconColor = "none";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
                }
                {
                  id = "plugin:e11650:display-device";
                }
                {
                  hideWhenZero = true;
                  hideWhenZeroUnread = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                  iconColor = "none";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          }
          {
            enabled = true;
            name = "sunshine";
            widgets = {
              left = [
                {
                  icon = "rocket";
                  id = "Launcher";
                  iconColor = "none";
                  useDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                }
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
                }
                # {
                #   defaultSettings = {
                #     enableTodoIntegration = true;
                #     notecardsEnabled = true;
                #     pincardsEnabled = true;
                #     position = "Bottom";
                #     showCloseButton = false;
                #   };
                #   id = "plugin:clipper";
                # }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.6;
                  id = "Workspace";
                  labelMode = "index";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  fontWeight = "bold";
                  showApplications = true;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = false;
                  unfocusedIconsOpacity = 1;
                  showApplicationsHover = false;
                }
                {
                  defaultSettings = {
                    borderRadius = 1;
                    expandDirection = "left";
                    focusBorderColor = "primary";
                    mainIcon = "layout-grid";
                    primaryPillColor = "none";
                    primaryShowPill = false;
                    primarySize = 0.9;
                    primarySymbolColor = "none";
                    secondaryPillColor = "primary";
                    secondaryShowPill = true;
                    secondarySize = 0.9;
                    secondarySymbolColor = "none";
                    workspaces = [
                      {
                        icon = "letter-a";
                        name = "A";
                      }
                      {
                        icon = "letter-s";
                        name = "S";
                      }
                      {
                        icon = "letter-d";
                        name = "D";
                      }
                    ];
                  };
                  id = "plugin:special-workspaces";
                }

              ];
              center = [
                {
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  compactMode = true;
                  hideMode = "hidden";
                  hideWhenIdle = false;
                  id = "MediaMini";
                  maxWidth = 300;
                  panelShowAlbumArt = true;
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showArtistFirst = false;
                  showProgressRing = true;
                  showVisualizer = true;
                  useFixedWidth = false;
                  visualizerType = "linear";
                  textColor = "none";
                }
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  displayMode = "onhover";
                  iconColor = "none";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
                }
                {
                  id = "plugin:e11650:display-device";
                }
                {
                  hideWhenZero = true;
                  hideWhenZeroUnread = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                  iconColor = "none";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          }
        ];
      };

      brightness = {
        backlightDeviceMappings = [ ];
        brightnessStep = 1;
        enforceMinimum = true;
        enableDdcSupport = true;
      };

      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };

      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Gruvbox";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "tonal-spot";
        monitorForColors = "";
        syncGsettings = true;
      };

      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              defaultSettings = {
                enableTodoIntegration = true;
                notecardsEnabled = true;
                pincardsEnabled = true;
                showCloseButton =true;
              };
              id = "plugin:clipper";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "plugin:kde-connect";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };

      desktopWidgets = {
        enabled = true;
        gridSnap = true;
        gridSnapScale = false;
        monitorWidgets = [
          {
            name= "eDP-1";
            widgets = [
              {
                hideMode = "visible";
                id = "MediaPlayer";
                roundedCorners = true;
                scale = 1.6983416033780894;
                showAlbumArt = true;
                showBackground = true;
                showButtons = true;
                showVisualizer = true;
                visualizerType = "linear";
                x = 1220;
                y = 60;
              }
              {
                diskPath = "/";
                id = "SystemStat";
                layout = "bottom";
                roundedCorners = true;
                scale = 1.4080963667879236;
                showBackground = true;
                statType = "CPU";
                x = 820;
                y = 1020;
              }
            ];
          }
          {
            name = "HDMI-A-1";
            widgets = [
              {
                clockColor = "none";
                clockStyle = "minimal";
                customFont = "";
                format = "HH:mm\\nd MMMM yyyy";
                id = "Clock";
                roundedCorners = true;
                scale = 4.537139686148306;
                showBackground = true;
                useCustomFont = false;
                usePrimaryColor = false;
                x = 620;
                y = 40;
              }
            ];
          }
        ];
        overviewEnabled = true;
      };

      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
        backgroundOpacity = 0.6;
        floatingRatio = 0.5;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        pinnedStatic = false;
        inactiveIndicators = false;
        deadOpacity = 0.6;
        animationSpeed = 1;
        dockType = "floating";
        groupApps = false;
        groupClickAction = "cycle";
        groupContextMenuMode = "extended";
        groupIndicatorStyle = "dots";
        indicatorColor = "primary";
        indicatorOpacity = 0.6;
        indicatorThickness = 3;
        launcherIconColor = "none";
        launcherPosition = "end";
        showDockIndicator = false;
        showLauncherIcon = false;
        sitOnFrame = false;
        launcherIcon = "";
        launcherUseDistroLogo = false;
      };

      general = {
        avatarImage = "/home/gambled/.face";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        clockFormat = "hh\\nmm";
        clockStyle = "custom";
        enableBlurBehind = true;
        enableLockScreenMediaControls = false;
        keybinds = {
          keyDown = [
            "Down"
          ];
          keyEnter = [
            "Return"
            "Enter"
          ];
          keyEscape = [
            "Esc"
          ];
          keyLeft = [
            "Left"
          ];
          keyRemove = [
            "Del"
          ];
          keyRight = [
            "Right"
          ];
          keyUp = [
            "Up"
          ];
        };
        lockScreenAnimations = false;
        lockScreenBlur = 0;
        lockScreenMonitors = [ ];
        lockScreenTint = 0;
        passwordChars = false;
        reverseScroll = false;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockOnSuspend = false;
        showSessionButtonsOnLockScreen = false;
        showHibernateOnLockScreen = false;
        enableShadows = false;
        shadowDirection = "center";
        shadowOffsetX = 0;
        shadowOffsetY = 0;
        language = "en";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        smoothScrollEnabled = true;
      };

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
        colorGeneration = "";
      };

      idle = {
        customCommands = "[]";
        enabled = false;
        fadeDuration = 5;
        lockCommand = "";
        lockTimeout = 660;
        resumeLockCommand = "";
        resumeScreenOffCommand = "";
        resumeSuspendCommand = "";
        screenOffCommand = "";
        screenOffTimeout = 600;
        suspendCommand = "";
        suspendTimeout = 1800;
      };

      location = {
        name = "Zapopan";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = false;
        weatherTaliaMascotAlways = false;
      };

      network = {
        bluetoothAutoConnect = true;
        disableDiscoverability = false;
        networkPanelView = "wifi";
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
      };

      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      noctaliaPerformance = {
        disableDesktopWidgets = false;
        disableWallpaper = false;
      };

      notifications = {
        enabled = true;
        monitors = [
          "DP-3"
          "HDMI-A-1"
          "sunshine"
        ];
        location = "top";
        overlayLayer = true;
        backgroundOpacity = 0.6;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = false;
        enableBatteryToast = true;
        enableMarkdown = true;
        density = "comfortable";
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
      };

      osd = {
        enabled = true;
        location = "top";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 0.6;
        enabledTypes = [
          0
          1
          2
        ];
        monitors = [ ];
      };

      plugins = {
        autoUpdate = true;
        notifyUpdates = true;
      };

      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        largeButtonsStyle = true;
        largeButtonsLayout = "grid";
        showKeybinds = true;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
            keybind = "1";
          }
          {
            action = "suspend";
            enabled = true;
            keybind = "2";
          }
          {
            action = "hibernate";
            enabled = true;
            keybind = "3";
          }
          {
            action = "reboot";
            enabled = true;
            keybind = "4";
          }
          {
            action = "logout";
            enabled = true;
            keybind = "5";
          }
          {
            action = "shutdown";
            enabled = true;
            keybind = "6";
          }
        ];
      };

      systemMonitor = {
        diskAvailCriticalThreshold = 10;
        diskAvailWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        batteryWarningThreshold = 20;
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        enableDgpuMonitoring = false;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };

      templates = {
        activeTemplates = [ ];
        enableUserTheming = false;
      };

      ui = {
        fontDefault = "DejaVu Sans";
        fontFixed = "DejaVu Sans Mono";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        panelBackgroundOpacity = 0.6;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        boxBorderEnabled = true;
        scrollbarAlwaysVisible = false;
        settingsPanelSideBarCardStyle = true;
        tooltipsEnabled = true;
        translucentWidgets = false;
      };

      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        linkLightAndDarkWallpapers = true;
        useOriginalImages = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        skipStartupTransition = true;
        sortOrder = "name";
        directory = "/home/gambled/Pictures/Wallpapers/PC";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = false;
        fillMode = "fill";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "pixelate"
          "honeycomb"
        ];
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        favorites = [ ];
      };
    };
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
        {
          enabled = true;
          name = "Gambled's Plugins";
          url = "https://github.com/Gambled23/noctalia-plugins";
        }
      ];
      states = {
        clipper = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        kde-connect = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        polkit-agent = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        special-workspaces = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        ssh-sessions = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        usb-drive-manager = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        weekly-calendar = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        workspace-overview = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };

        "e11650:display-device" = {
          enabled = true;
          sourceUrl = "https://github.com/Gambled23/noctalia-plugins";
        };
      };
      version = 1;
    };
    pluginSettings = {
      # catwalk = {
      #   minimumThreshold = 25;
      #   hideBackground = true;
      # };
    };
  };

  home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
    text = builtins.toJSON {
      defaultWallpaper = "/etc/nixos/wallpaper.jpg";
      wallpapers = {
        "DP-3" = "/home/gambled/Pictures/Wallpapers/PC/gruvbox-ultrawide/wallhaven_1klxl3.jpg";
        "sunshine" = "/home/gambled/Pictures/Wallpapers/PC/anime/111257494_p1.jpg";
        "HDMI-A-1" = "/home/gambled/Pictures/Wallpapers/PC/anime/wallhaven_powjmm.jpg";
        "eDP-1" = "/home/gambled/Pictures/Wallpapers/PC/anime/wallhaven_powjmm.jpg";
      };
    };
  };
}
