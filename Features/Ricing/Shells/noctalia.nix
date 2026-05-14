# Home manager file
{ lib, inputs, pkgs, config, osConfig, ... }: 
let 
  default_desktop_widgets = [
    {
      clockColor = "none";
      clockStyle = "digital";
      customFont = "";
      format = "HH:mm\\nd MMMM yyyy";
      id = "Clock";
      roundedCorners = true;
      scale = 1.3174091884595163;
      showBackground = true;
      useCustomFont = false;
      x = if osConfig.networking.hostName == "pc-gambled" then 1445 else 827;
      y = if osConfig.networking.hostName == "pc-gambled" then 384 else 390;
    }
    {
      hideMode = "visible";
      id = "MediaPlayer";
      roundedCorners = true;
      scale = 2.3626262995809864;
      showAlbumArt = true;
      showBackground = true;
      showButtons = false;
      showVisualizer = true;
      visualizerType = "wave";
      x = if osConfig.networking.hostName == "pc-gambled" then 1118 else 500;
      y = if osConfig.networking.hostName == "pc-gambled" then 45 else 53;
    }
    {
      id = "Weather";
      roundedCorners = true;
      scale = 1.142967570256372;
      showBackground = true;
      x = if osConfig.networking.hostName == "pc-gambled" then 1118 else 500;
      y = if osConfig.networking.hostName == "pc-gambled" then 384 else 390;
    }
    {
      defaultSettings = {
        roundedCorners = true;
        showBackground = true;
      };
      id = "plugin:calendar-widget";
      scale = 1.4323710820047957;
      showBackground = true;
      x = if osConfig.networking.hostName == "pc-gambled" then 1695 else 1064;
      y = if osConfig.networking.hostName == "pc-gambled" then 262 else 269;
    }
    {
      hideMode = "visible";
      id = "MediaPlayer";
      roundedCorners = true;
      scale = 1.3071426522512377;
      showAlbumArt = false;
      showBackground = true;
      showButtons = true;
      showVisualizer = false;
      visualizerType = "linear";
      x = if osConfig.networking.hostName == "pc-gambled" then 1118 else 500;
      y = if osConfig.networking.hostName == "pc-gambled" then 262 else 269;
    }
    {
      defaultSettings = {
        hideBackground = false;
        minimumThreshold = 10;
      };
      id = "plugin:catwalk";
      scale = 1.106362479106558;
      showBackground = true;
      x = if osConfig.networking.hostName == "pc-gambled" then 1445 else 826;
      y = if osConfig.networking.hostName == "pc-gambled" then 595 else 601;
    }
    {
      diskPath = "/";
      id = "SystemStat";
      layout = "bottom";
      roundedCorners = true;
      scale = 1.2896928094173636;
      showBackground = true;
      statType = "Memory";
      x = if osConfig.networking.hostName == "pc-gambled" then 1118 else 500;
      y = if osConfig.networking.hostName == "pc-gambled" then 520 else 525;
    }
  ];
in 
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    package = (inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override { calendarSupport = true; });
    
    # colors = lib.mkForce {
    #   mPrimary = "#b8bb26";
    #   mOnPrimary = "#282828";
    #   mSecondary = "#fabd2f";
    #   mOnSecondary = "#282828";
    #   mTertiary = "#83a598";
    #   mOnTertiary = "#282828";
    #   mError = "#fb4934";
    #   mOnError = "#282828";
    #   mSurface = "#282828";
    #   mOnSurface = "#fbf1c7";
    #   mSurfaceVariant = "#3c3836";
    #   mOnSurfaceVariant = "#ebdbb2";
    #   mOutline = "#57514e";
    #   mShadow = "#282828";
    #   mHover = "#83a598";
    #   mOnHover = "#282828";
    #   terminal = {
    #     normal = {
    #       black = "#282828";
    #       red = "#cc241d";
    #       green = "#98971a";
    #       yellow = "#d79921";
    #       blue = "#458588";
    #       magenta = "#b16286";
    #       cyan = "#689d6a";
    #       white = "#a89984";
    #     };
    #     bright = {
    #       black = "#928374";
    #       red = "#fb4934";
    #       green = "#b8bb26";
    #       yellow = "#fabd2f";
    #       blue = "#83a598";
    #       magenta = "#d3869b";
    #       cyan = "#8ec07c";
    #       white = "#ebdbb2";
    #     };
    #     foreground = "#ebdbb2";
    #     background = "#282828";
    #     selectionFg = "#ebdbb2";
    #     selectionBg = "#665c54";
    #     cursorText = "#282828";
    #     cursor = "#ebdbb2";
    #   };
    # };
    user-templates = {
      config = {
        # General template settings
      };
      templates = {
        spicetify-nix = {
          input_path = "~/.config/noctalia/templates/spicetify.ini";
          output_path = "/etc/nixos/Features/Ricing/noctalia_colors/spicetify.ini";
          # post_hook = "myapp --reload-theme";
        };
        nvf = {
          input_path = "~/.config/noctalia/templates/nvf.nix";
          output_path = "/etc/nixos/Features/Ricing/noctalia_colors/nvf.nix";
          # post_hook = "myapp --reload-theme";
        };
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
        mouseWheelAction = "workspace";
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
        frameRadius = 10;
        outerCorners = false;
        displayMode = "always_visible";
        fontScale = 1;
        middleClickAction = "controlCenter";
        middleClickCommand = "";
        middleClickFollowMouse = false;
        hideOnOverview = false;

        widgets = {
          center = [ ];
          left = [ ];
          right = [ ];
        };

        #Widgets per screen
        screenOverrides = [
          {
            enabled = true;
            name = "HDMI-A-1";
            widgets = {
              left = [
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
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
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
              ];
              center = [
                {
                  defaultSettings = {
                    autoMount = false;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "primary";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
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
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "primary";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-always";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "alwaysShow";
                  iconColor = "primary";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
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
                  id = "plugin:clipboard";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "primary";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = true;
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
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
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
              ];
              center = [
                {
                  defaultSettings = {
                    autoMount = false;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "primary";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
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
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "primary";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-always";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "alwaysShow";
                  iconColor = "primary";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
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
                  id = "plugin:clipboard";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "primary";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = true;
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
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  defaultSettings = {
                  };
                  id = "plugin:workspace-overview";
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
              ];
              center = [
                {
                  defaultSettings = {
                    autoMount = false;
                    fileBrowser = "yazi";
                    hideWhenEmpty = true;
                    iconColor = "primary";
                    showBadge = true;
                    showNotifications = true;
                    terminalCommand = "ghostty";
                  };
                  id = "plugin:usb-drive-manager";
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
              ];
              right = [
                {
                  blacklist = [];
                  chevronColor = "primary";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "icon-always";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = true;
                  showPowerProfiles = true;
                }
                {
                  displayMode = "alwaysShow";
                  iconColor = "primary";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
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
                  id = "plugin:e11650:display-device";
                }
                {
                  id = "plugin:clipboard";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "primary";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = true;
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
                  hideWhenZero = true;
                  hideWhenZeroUnread = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                  iconColor = "none";
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
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "primary";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = true;
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
        useWallpaperColors = true;
        predefinedScheme = "Gruvbox";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "vibrant";
        monitorForColors =
          if osConfig.networking.hostName == "dev-gambled" 
          then "eDP-1"
          else "DP-3";
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
              id = "plugin:kde-connect";
            }
            {
              id = "Notifications";
            }
            {
              defaultSettings = {
                entities = [
                ];
                haToken = "";
                haUrl = "";
              };
              id = "plugin:hassio";
            }
          ];
          right = [
            {
              id = "KeepAwake";
            }
            {
              defaultSettings = {
                backend = "auto";
                gridSize = 40;
                hyprctlCommand = "hyprctl";
                iconColor = "primary";
                snapToGrid = true;
                swayCommand = "swaymsg";
              };
              id = "plugin:monitor-layout";
            }
            {
              defaultSettings = {
                colorHistory = [
                ];
                detectedCompositor = "";
                detectedRecorder = "";
                filenameFormat = "";
                installedLangs = [
                  "eng"
                ];
                paletteColors = [
                ];
                screenshotPath = "";
                selectedOcrLang = "eng";
                transAvailable = false;
                videoPath = "";
              };
              id = "plugin:screen-toolkit";
            }
            {
              id = "NightLight";
            }
            {
              id = "WallpaperSelector";
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
        gridSnap = false;
        gridSnapScale = false;
        monitorWidgets = [
          {
            name= "eDP-1";
            widgets = default_desktop_widgets;
          }
          {
            name = "HDMI-A-1";
            widgets = default_desktop_widgets;
          }
          {
            name = "DP-3";
            widgets = default_desktop_widgets;
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
        avatarImage = "/home/gambled/face.jpg";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        clockFormat = "hh\\nmm";
        clockStyle = "digital";
        enableBlurBehind = true;
        enableLockScreenMediaControls = true;
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
        lockScreenAnimations = true;
        lockScreenBlur = 1;
        lockScreenMonitors = [ ];
        lockScreenTint = 0.1;
        passwordChars = true;
        reverseScroll = false;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockOnSuspend = true;
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
        enabled = true;
        fadeDuration = 10;
        lockCommand = "";
        lockTimeout = 900;
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
        enabled = true;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        # manualSunrise = "06:30";
        # manualSunset = "18:30";
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
        location = "right";
        autoHideMs = 3000;
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
        activeTemplates = [
          {
            enabled = true;
            id = "ghostty";
          }
          {
            enabled = true;
            id = "yazi";
          }
          {
            enabled = true;
            id = "btop";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "spicetify";
          }
          {
            enabled = true;
            id = "kcolorscheme";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "code";
          }
          {
            enabled = true;
            id = "hyprland";
          }
          {
            enabled = true;
            id = "alacritty";
          }
          {
            enabled = true;
            id = "starship";
          }
          {
            enabled = true;
            id = "discord";
          }
          {
            enabled = true;
            id = "vicinae";
          }
          {
            enabled = true;
            id ="steam";
          }
          {
            enabled = true;
            id ="hyprtoolkit";
          }
          {
            enabled = true;
            id ="zed";
          }
        ];
        enableUserTheming = true;
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
        directory = "/home/gambled/Pictures/Wallpapers";
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
        calendar-widget = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        catwalk = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        clipboard = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        custom-commands = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        custom-sticker = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        hassio = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        kde-connect = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        monitor-layout = {
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
        screen-toolkit = {
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
        "DP-3" = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_zpqj8g.jpg";
        "sunshine" = "/home/gambled/Pictures/Wallpapers/Wide/anime/36206589_p0.jpg";
        "HDMI-A-1" = "/home/gambled/Pictures/Wallpapers/Wide/mix/flower.jpg";
        "eDP-1" = "/home/gambled/Pictures/Wallpapers/Wide/mix/flower.jpg";
      };
    };
  };

  home.file.".config/noctalia/templates/spicetify.ini".text = ''
    text               = {{colors.on_surface.default.hex_stripped}}
    subtext            = {{colors.on_surface_variant.default.hex_stripped}}
    main               = {{colors.surface.default.hex_stripped}}
    main-elevated      = {{colors.surface.default.hex_stripped}}
    main-transition    = {{colors.surface_container_lowest.default.hex_stripped}}
    highlight          = {{colors.surface_container_low.default.hex_stripped}}
    highlight-elevated = {{colors.surface_container_highest.default.hex_stripped}}
    sidebar            = {{colors.surface.default.hex_stripped}}
    player             = {{colors.surface.default.hex_stripped}}
    card               = {{colors.surface.default.hex_stripped}}
    shadow             = {{colors.surface.default.hex_stripped}}
    selected-row       = {{colors.on_surface.default.hex_stripped}}
    button             = {{colors.primary.default.hex_stripped}}
    button-active      = {{colors.primary.default.hex_stripped}}
    button-disabled    = {{colors.primary.default.hex_stripped}}
    tab-active         = {{colors.surface.default.hex_stripped}}
    notification       = {{colors.tertiary.default.hex_stripped}}
    notification-error = {{colors.error.default.hex_stripped}}
    misc               = {{colors.surface.default.hex_stripped}}
    play-button        = {{colors.secondary.default.hex_stripped}}
    play-button-active = {{colors.secondary.default.hex_stripped}}
    progress-fg        = {{colors.primary.default.hex_stripped}}
    progress-bg        = {{colors.surface.default.hex_stripped}}
    heart              = {{colors.error.default.hex_stripped}}
    pagelink-active    = {{colors.on_tertiary_container.default.hex_stripped}}
    radio-btn-active   = {{colors.on_tertiary_container.default.hex_stripped}}
  '';

  home.file.".config/noctalia/templates/nvf.nix".text = ''
    {
      base00 = "{{colors.surface.default.hex}}";
      base01 = "{{colors.surface_container.default.hex}}";
      base02 = "{{colors.surface_container_high.default.hex}}";
      base03 = "{{colors.outline.default.hex}}";
      base04 = "{{colors.on_surface_variant.default.hex}}";
      base05 = "{{colors.on_surface.default.hex}}";
      base06 = "{{colors.on_surface.default.hex}}";
      base07 = "{{colors.on_background.default.hex}}";
      base08 = "{{colors.error.default.hex}}";
      base09 = "{{colors.tertiary.default.hex}}";
      base0A = "{{colors.secondary.default.hex}}";
      base0B = "{{colors.primary.default.hex}}";
      base0C = "{{colors.tertiary_fixed_dim.default.hex}}";
      base0D = "{{colors.primary_fixed_dim.default.hex}}";
      base0E = "{{colors.secondary_fixed_dim.default.hex}}";
      base0F = "{{colors.error_container.default.hex}}";
    }
  '';

  home.packages = with pkgs; [
    # For screenshotting and screen recording plugins
    grim
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    ffmpeg
    jq
    wl-screenrec
    adw-gtk3 # custom color theme for gtk
    qt6.qtwebsockets 
  ];
}
