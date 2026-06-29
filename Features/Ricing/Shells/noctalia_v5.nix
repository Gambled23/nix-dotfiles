# Home manager file
{ lib, inputs, pkgs, config, osConfig, ... }:
let
  noctalia_settings = 
  {
      launch_apps_as_systemd_services = true;
      settingsVersion = 59;
      appLauncher = {
          autoPasteClipboard = false;
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWrapText = true;
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          density = "comfortable";
          enableClipPreview = true;
          enableClipboardChips = true;
          enableClipboardHistory = true;
          enableClipboardSmartIcons = true;
          enableSessionSearch = true;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          iconMode = "tabler";
          ignoreMouseInput = false;
          overviewLayer = true;
          pinnedApps = [  ];
          position = "center";
          screenshotAnnotationTool = "";
          showCategories = true;
          showIconBackground = false;
          sortByMostUsed = true;
          terminalCommand = "ghostty -e";
          viewMode = "list";
      };
      audio = {
          enable_sounds = true;
          mprisBlacklist = [  ];
          notification_sound = "${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/completion-success.oga";
          preferredPlayer = "Spotify";
          spectrumFrameRate = 30;
          spectrumMirrored = true;
          visualizerType = "wave";
          volumeFeedback = true;
          volumeOverdrive = false;
          volumeStep = 1;
          volume_change_sound = "${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/bell.oga";
      };
      bar = {
          autoHideDelay = 500;
          autoShowDelay = 150;
          backgroundOpacity = 0.2;
          barType = "framed";
          capsuleColorKey = "none";
          capsuleOpacity = 1;
          contentPadding = 2;
          density = "comfortable";
          displayMode = "always_visible";
          enableExclusionZoneInset = true;
          fontScale = 1;
          frameRadius = 10;
          frameThickness = 4;
          hideOnOverview = false;
          marginHorizontal = 4;
          marginVertical = 4;
          middleClickAction = "controlCenter";
          middleClickCommand = "";
          middleClickFollowMouse = false;
          monitors = [ "eDP-1" "DP-3" "HDMI-A-1" "sunshine" ];
          mouseWheelAction = "workspace";
          mouseWheelWrap = true;
          order = [ "widgets" ];
          outerCorners = false;
          position = "top";
          reverseScroll = false;
          rightClickAction = "controlCenter";
          rightClickCommand = "";
          rightClickFollowMouse = true;
          showCapsule = true;
          showOnWorkspaceSwitch = true;
          showOutline = false;
          useSeparateOpacity = false;
          widgetSpacing = 6;
          widgets = {
              background_opacity = 0.29999999329447746;
              center = [ "group:g1" ];
              end = [ "tray" "clipboard" "bluetooth" "volume" "brightness" "battery" "control-center" ];
              left = [  ];
              margin_edge = 5;
              margin_ends = 8;
              right = [  ];
              scale = 1.1500000096857548;
              start = [ "vicinae" "workspaces" "wallhaven" ];
              capsule_group = [ {
                  fill = "surface_variant";
                  id = "g1";
                  members = [ "clock" "media" "notifications" ];
                  opacity = 1.0;
                  padding = 10.0;
                  radius = 7.0;
              } ];
          };
          screenOverrides = [ {
              enabled = true;
              name = "HDMI-A-1";
              widgets = {
                  center = [ {
                      id = "plugin:usb-drive-manager";
                      defaultSettings = {
                          autoMount = false;
                          fileBrowser = "yazi";
                          hideWhenEmpty = true;
                          iconColor = "primary";
                          showBadge = true;
                          showNotifications = true;
                          terminalCommand = "ghostty";
                      };
                  } {
                      hideWhenZero = true;
                      hideWhenZeroUnread = true;
                      iconColor = "none";
                      id = "NotificationHistory";
                      showUnreadBadge = true;
                      unreadBadgeColor = "primary";
                  } {
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
                      textColor = "none";
                      useFixedWidth = false;
                      visualizerType = "linear";
                  } {
                      id = "plugin:privacy-indicator";
                      defaultSettings = {
                          activeColor = "primary";
                          enableToast = true;
                          hideInactive = true;
                          iconSpacing = 4;
                          inactiveColor = "none";
                          micFilterRegex = "";
                          removeMargins = false;
                      };
                  } ];
                  left = [ {
                      clockColor = "none";
                      customFont = "";
                      formatHorizontal = "HH:mm";
                      formatVertical = "HH mm - dd MM";
                      id = "Clock";
                      tooltipFormat = "HH:mm ddd, MMM dd";
                      useCustomFont = false;
                  } {
                      id = "plugin:workspace-overview";
                      defaultSettings = {
                          
                      };
                  } {
                      id = "plugin:special-workspaces";
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
                          workspaces = [ {
                              icon = "letter-a";
                              name = "A";
                          } {
                              icon = "letter-s";
                              name = "S";
                          } {
                              icon = "letter-d";
                              name = "D";
                          } ];
                      };
                  } {
                      characterCount = 2;
                      colorizeIcons = false;
                      emptyColor = "secondary";
                      enableScrollWheel = true;
                      focusedColor = "primary";
                      followFocusedScreen = false;
                      fontWeight = "bold";
                      groupedBorderOpacity = 1;
                      hideUnoccupied = false;
                      iconScale = 0.6;
                      id = "Workspace";
                      labelMode = "index";
                      occupiedColor = "secondary";
                      pillSize = 0.6;
                      showApplications = true;
                      showApplicationsHover = false;
                      showBadge = true;
                      showLabelsOnlyWhenOccupied = false;
                      unfocusedIconsOpacity = 1;
                  } ];
                  right = [ {
                      blacklist = [  ];
                      chevronColor = "primary";
                      colorizeIcons = false;
                      drawerEnabled = true;
                      hidePassive = false;
                      id = "Tray";
                      pinned = [  ];
                  } {
                      deviceNativePath = "__default__";
                      displayMode = "icon-always";
                      hideIfIdle = false;
                      hideIfNotDetected = true;
                      id = "Battery";
                      showNoctaliaPerformance = true;
                      showPowerProfiles = true;
                  } {
                      displayMode = "alwaysShow";
                      iconColor = "primary";
                      id = "Volume";
                      middleClickCommand = "pwvucontrol || pavucontrol";
                      textColor = "none";
                  } {
                      commandPrefix = "ssh";
                      id = "plugin:ssh-sessions";
                      defaultSettings = {
                          pollInterval = 10;
                          showInactiveHosts = true;
                          terminalCommand = "";
                      };
                  } {
                      id = "plugin:git-companion";
                  } {
                      id = "plugin:clipboard";
                  } {
                      id = "plugin:assistant-panel";
                  } {
                      id = "plugin:mangowc-layout-switcher";
                  } {
                      colorizeDistroLogo = false;
                      colorizeSystemIcon = "primary";
                      colorizeSystemText = "none";
                      customIconPath = "";
                      enableColorization = true;
                      icon = "noctalia";
                      id = "ControlCenter";
                      useDistroLogo = true;
                  } ];
              };
          } {
              enabled = true;
              name = "eDP-1";
              widgets = {
                  center = [ {
                      id = "plugin:usb-drive-manager";
                      defaultSettings = {
                          autoMount = false;
                          fileBrowser = "yazi";
                          hideWhenEmpty = true;
                          iconColor = "primary";
                          showBadge = true;
                          showNotifications = true;
                          terminalCommand = "ghostty";
                      };
                  } {
                      hideWhenZero = true;
                      hideWhenZeroUnread = true;
                      iconColor = "none";
                      id = "NotificationHistory";
                      showUnreadBadge = true;
                      unreadBadgeColor = "primary";
                  } {
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
                      textColor = "none";
                      useFixedWidth = false;
                      visualizerType = "linear";
                  } {
                      id = "plugin:privacy-indicator";
                      defaultSettings = {
                          activeColor = "primary";
                          enableToast = true;
                          hideInactive = true;
                          iconSpacing = 4;
                          inactiveColor = "none";
                          micFilterRegex = "";
                          removeMargins = false;
                      };
                  } ];
                  left = [ {
                      clockColor = "none";
                      customFont = "";
                      formatHorizontal = "HH:mm";
                      formatVertical = "HH mm - dd MM";
                      id = "Clock";
                      tooltipFormat = "HH:mm ddd, MMM dd";
                      useCustomFont = false;
                  } {
                      id = "plugin:workspace-overview";
                      defaultSettings = {
                          
                      };
                  } {
                      id = "plugin:special-workspaces";
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
                          workspaces = [ {
                              icon = "letter-a";
                              name = "A";
                          } {
                              icon = "letter-s";
                              name = "S";
                          } {
                              icon = "letter-d";
                              name = "D";
                          } ];
                      };
                  } {
                      characterCount = 2;
                      colorizeIcons = false;
                      emptyColor = "secondary";
                      enableScrollWheel = true;
                      focusedColor = "primary";
                      followFocusedScreen = false;
                      fontWeight = "bold";
                      groupedBorderOpacity = 1;
                      hideUnoccupied = false;
                      iconScale = 0.6;
                      id = "Workspace";
                      labelMode = "index";
                      occupiedColor = "secondary";
                      pillSize = 0.6;
                      showApplications = true;
                      showApplicationsHover = false;
                      showBadge = true;
                      showLabelsOnlyWhenOccupied = false;
                      unfocusedIconsOpacity = 1;
                  } ];
                  right = [ {
                      blacklist = [  ];
                      chevronColor = "primary";
                      colorizeIcons = false;
                      drawerEnabled = true;
                      hidePassive = false;
                      id = "Tray";
                      pinned = [  ];
                  } {
                      deviceNativePath = "__default__";
                      displayMode = "icon-always";
                      hideIfIdle = false;
                      hideIfNotDetected = true;
                      id = "Battery";
                      showNoctaliaPerformance = true;
                      showPowerProfiles = true;
                  } {
                      displayMode = "alwaysShow";
                      iconColor = "primary";
                      id = "Volume";
                      middleClickCommand = "pwvucontrol || pavucontrol";
                      textColor = "none";
                  } {
                      commandPrefix = "ssh";
                      id = "plugin:ssh-sessions";
                      defaultSettings = {
                          pollInterval = 10;
                          showInactiveHosts = true;
                          terminalCommand = "";
                      };
                  } {
                      id = "plugin:git-companion";
                  } {
                      id = "plugin:clipboard";
                  } {
                      id = "plugin:assistant-panel";
                  } {
                      id = "plugin:mangowc-layout-switcher";
                  } {
                      colorizeDistroLogo = false;
                      colorizeSystemIcon = "primary";
                      colorizeSystemText = "none";
                      customIconPath = "";
                      enableColorization = true;
                      icon = "noctalia";
                      id = "ControlCenter";
                      useDistroLogo = true;
                  } ];
              };
          } {
              enabled = true;
              name = "DP-3";
              widgets = {
                  center = [ {
                      id = "plugin:usb-drive-manager";
                      defaultSettings = {
                          autoMount = false;
                          fileBrowser = "yazi";
                          hideWhenEmpty = true;
                          iconColor = "primary";
                          showBadge = true;
                          showNotifications = true;
                          terminalCommand = "ghostty";
                      };
                  } {
                      hideWhenZero = true;
                      hideWhenZeroUnread = true;
                      iconColor = "none";
                      id = "NotificationHistory";
                      showUnreadBadge = true;
                      unreadBadgeColor = "primary";
                  } {
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
                      textColor = "none";
                      useFixedWidth = false;
                      visualizerType = "linear";
                  } {
                      id = "plugin:privacy-indicator";
                      defaultSettings = {
                          activeColor = "primary";
                          enableToast = true;
                          hideInactive = true;
                          iconSpacing = 4;
                          inactiveColor = "none";
                          micFilterRegex = "";
                          removeMargins = false;
                      };
                  } ];
                  left = [ {
                      clockColor = "none";
                      customFont = "";
                      formatHorizontal = "HH:mm";
                      formatVertical = "HH mm - dd MM";
                      id = "Clock";
                      tooltipFormat = "HH:mm ddd, MMM dd";
                      useCustomFont = false;
                  } {
                      id = "plugin:workspace-overview";
                      defaultSettings = {
                          
                      };
                  } {
                      id = "plugin:special-workspaces";
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
                          workspaces = [ {
                              icon = "letter-a";
                              name = "A";
                          } {
                              icon = "letter-s";
                              name = "S";
                          } {
                              icon = "letter-d";
                              name = "D";
                          } ];
                      };
                  } {
                      characterCount = 2;
                      colorizeIcons = false;
                      emptyColor = "secondary";
                      enableScrollWheel = true;
                      focusedColor = "primary";
                      followFocusedScreen = false;
                      fontWeight = "bold";
                      groupedBorderOpacity = 1;
                      hideUnoccupied = false;
                      iconScale = 0.6;
                      id = "Workspace";
                      labelMode = "index";
                      occupiedColor = "secondary";
                      pillSize = 0.6;
                      showApplications = true;
                      showApplicationsHover = false;
                      showBadge = true;
                      showLabelsOnlyWhenOccupied = false;
                      unfocusedIconsOpacity = 1;
                  } ];
                  right = [ {
                      blacklist = [  ];
                      chevronColor = "primary";
                      colorizeIcons = false;
                      drawerEnabled = true;
                      hidePassive = false;
                      id = "Tray";
                      pinned = [  ];
                  } {
                      deviceNativePath = "__default__";
                      displayMode = "icon-always";
                      hideIfIdle = false;
                      hideIfNotDetected = true;
                      id = "Battery";
                      showNoctaliaPerformance = true;
                      showPowerProfiles = true;
                  } {
                      displayMode = "alwaysShow";
                      iconColor = "primary";
                      id = "Volume";
                      middleClickCommand = "pwvucontrol || pavucontrol";
                      textColor = "none";
                  } {
                      commandPrefix = "ssh";
                      id = "plugin:ssh-sessions";
                      defaultSettings = {
                          pollInterval = 10;
                          showInactiveHosts = true;
                          terminalCommand = "";
                      };
                  } {
                      id = "plugin:e11650:display-device";
                  } {
                      id = "plugin:clipboard";
                  } {
                      id = "plugin:assistant-panel";
                  } {
                      id = "plugin:mangowc-layout-switcher";
                  } {
                      colorizeDistroLogo = false;
                      colorizeSystemIcon = "primary";
                      colorizeSystemText = "none";
                      customIconPath = "";
                      enableColorization = true;
                      icon = "noctalia";
                      id = "ControlCenter";
                      useDistroLogo = true;
                  } ];
              };
          } {
              enabled = true;
              name = "sunshine";
              widgets = {
                  center = [ {
                      clockColor = "none";
                      customFont = "";
                      formatHorizontal = "HH:mm";
                      formatVertical = "HH mm - dd MM";
                      id = "Clock";
                      tooltipFormat = "HH:mm ddd, MMM dd";
                      useCustomFont = false;
                  } {
                      hideWhenZero = true;
                      hideWhenZeroUnread = true;
                      iconColor = "none";
                      id = "NotificationHistory";
                      showUnreadBadge = true;
                      unreadBadgeColor = "primary";
                  } {
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
                      textColor = "none";
                      useFixedWidth = false;
                      visualizerType = "linear";
                  } ];
                  left = [ {
                      colorizeSystemIcon = "primary";
                      colorizeSystemText = "none";
                      generalTooltipText = "Vicinae";
                      hideMode = "alwaysExpanded";
                      icon = "rocket";
                      iconPosition = "left";
                      id = "CustomButton";
                      ipcIdentifier = "";
                      leftClickExec = "vicinae toggle";
                      leftClickUpdateText = true;
                      middleClickExec = "";
                      middleClickUpdateText = false;
                      parseJson = false;
                      rightClickExec = "";
                      rightClickUpdateText = false;
                      showExecTooltip = true;
                      showIcon = true;
                      showTextTooltip = true;
                      textCollapse = "";
                      textCommand = "";
                      textIntervalMs = 3000;
                      textStream = false;
                      wheelDownExec = "";
                      wheelDownUpdateText = false;
                      wheelExec = "";
                      wheelMode = "unified";
                      wheelUpExec = "";
                      wheelUpUpdateText = false;
                      wheelUpdateText = false;
                      maxTextLength = {
                          horizontal = 10;
                          vertical = 10;
                      };
                  } {
                      id = "plugin:workspace-overview";
                      defaultSettings = {
                          
                      };
                  } {
                      characterCount = 2;
                      colorizeIcons = false;
                      emptyColor = "secondary";
                      enableScrollWheel = true;
                      focusedColor = "primary";
                      followFocusedScreen = false;
                      fontWeight = "bold";
                      groupedBorderOpacity = 1;
                      hideUnoccupied = false;
                      iconScale = 0.6;
                      id = "Workspace";
                      labelMode = "index";
                      occupiedColor = "secondary";
                      pillSize = 0.6;
                      showApplications = true;
                      showApplicationsHover = false;
                      showBadge = true;
                      showLabelsOnlyWhenOccupied = false;
                      unfocusedIconsOpacity = 1;
                  } {
                      id = "plugin:special-workspaces";
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
                          workspaces = [ {
                              icon = "letter-a";
                              name = "A";
                          } {
                              icon = "letter-s";
                              name = "S";
                          } {
                              icon = "letter-d";
                              name = "D";
                          } ];
                      };
                  } ];
                  right = [ {
                      blacklist = [  ];
                      chevronColor = "none";
                      colorizeIcons = false;
                      drawerEnabled = true;
                      hidePassive = false;
                      id = "Tray";
                      pinned = [  ];
                  } {
                      displayMode = "onhover";
                      iconColor = "none";
                      id = "Volume";
                      middleClickCommand = "pwvucontrol || pavucontrol";
                      textColor = "none";
                  } {
                      id = "plugin:e11650:display-device";
                  } {
                      id = "plugin:mangowc-layout-switcher";
                  } {
                      colorizeDistroLogo = false;
                      colorizeSystemIcon = "primary";
                      colorizeSystemText = "none";
                      customIconPath = "";
                      enableColorization = true;
                      icon = "noctalia";
                      id = "ControlCenter";
                      useDistroLogo = true;
                  } ];
              };
          } ];
      };
      brightness = {
          backlightDeviceMappings = [  ];
          brightnessStep = 1;
          enableDdcSupport = true;
          enforceMinimum = true;
      };
      calendar = {
          enabled = true;
          account = {
              personal_google = {
                  name = "ipog71";
                  type = "google";
              };
          };
          cards = [ {
              enabled = true;
              id = "calendar-header-card";
          } {
              enabled = true;
              id = "calendar-month-card";
          } {
              enabled = true;
              id = "weather-card";
          } ];
      };
      colorSchemes = {
          darkMode = true;
          generationMethod = "vibrant";
          manualSunrise = "06:30";
          manualSunset = "18:30";
          monitorForColors = "DP-3";
          predefinedScheme = "Gruvbox";
          schedulingMode = "off";
          syncGsettings = true;
          useWallpaperColors = true;
      };
      controlCenter = {
          diskPath = "/";
          position = "close_to_bar_button";
          shortcuts = {
              left = [ {
                  id = "Network";
              } {
                  id = "Bluetooth";
              } {
                  id = "plugin:kde-connect";
              } {
                  id = "Notifications";
              } {
                  id = "plugin:hassio";
                  defaultSettings = {
                      entities = [  ];
                      haToken = "";
                      haUrl = "";
                  };
              } ];
              right = [ {
                  id = "KeepAwake";
              } {
                  id = "plugin:screen-toolkit";
                  defaultSettings = {
                      colorHistory = [  ];
                      detectedCompositor = "";
                      detectedRecorder = "";
                      filenameFormat = "";
                      installedLangs = [ "eng" ];
                      paletteColors = [  ];
                      screenshotPath = "";
                      selectedOcrLang = "eng";
                      transAvailable = false;
                      videoPath = "";
                  };
              } {
                  id = "NightLight";
              } {
                  id = "WallpaperSelector";
              } ];
          };
          cards = [ {
              enabled = true;
              id = "profile-card";
          } {
              enabled = true;
              id = "shortcuts-card";
          } {
              enabled = true;
              id = "audio-card";
          } {
              enabled = true;
              id = "brightness-card";
          } {
              enabled = true;
              id = "weather-card";
          } {
              enabled = true;
              id = "media-sysmon-card";
          } ];
      };
      control_center = {
          width = 800;
          shortcuts = [ {
              type = "wifi";
          } {
              type = "bluetooth";
          } {
              type = "notification";
          } {
              type = "clipboard";
          } {
              type = "dark_mode";
          } {
              type = "power_profile";
          } ];
      };
      desktopWidgets = {
          enabled = true;
          gridSnap = false;
          gridSnapScale = false;
          overviewEnabled = true;
          monitorWidgets = [ {
              name = "eDP-1";
              widgets = [ {
                  clockColor = "none";
                  clockStyle = "digital";
                  customFont = "";
                  format = ''
      HH:mm
      d MMMM yyyy'';
                  id = "Clock";
                  roundedCorners = true;
                  scale = 1.3174091884595165;
                  showBackground = true;
                  useCustomFont = false;
                  x = 1445;
                  y = 384;
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 2.3626262995809864;
                  showAlbumArt = true;
                  showBackground = true;
                  showButtons = false;
                  showVisualizer = false;
                  visualizerType = "wave";
                  x = 1118;
                  y = 45;
              } {
                  id = "Weather";
                  roundedCorners = true;
                  scale = 1.142967570256372;
                  showBackground = true;
                  x = 1118;
                  y = 384;
              } {
                  id = "plugin:calendar-widget";
                  scale = 1.4323710820047957;
                  showBackground = true;
                  x = 1695;
                  y = 262;
                  defaultSettings = {
                      roundedCorners = true;
                      showBackground = true;
                  };
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 1.3071426522512375;
                  showAlbumArt = false;
                  showBackground = true;
                  showButtons = true;
                  showVisualizer = false;
                  visualizerType = "linear";
                  x = 1118;
                  y = 262;
              } {
                  id = "plugin:catwalk";
                  scale = 1.106362479106558;
                  showBackground = true;
                  x = 1445;
                  y = 595;
                  defaultSettings = {
                      hideBackground = false;
                      minimumThreshold = 10;
                  };
              } {
                  diskPath = "/";
                  id = "SystemStat";
                  layout = "bottom";
                  roundedCorners = true;
                  scale = 1.2896928094173636;
                  showBackground = true;
                  statType = "Memory";
                  x = 1118;
                  y = 520;
              } ];
          } {
              name = "HDMI-A-1";
              widgets = [ {
                  clockColor = "none";
                  clockStyle = "digital";
                  customFont = "";
                  format = ''
      HH:mm
      d MMMM yyyy'';
                  id = "Clock";
                  roundedCorners = true;
                  scale = 1.3174091884595165;
                  showBackground = true;
                  useCustomFont = false;
                  x = 1445;
                  y = 384;
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 2.3626262995809864;
                  showAlbumArt = true;
                  showBackground = true;
                  showButtons = false;
                  showVisualizer = false;
                  visualizerType = "wave";
                  x = 1118;
                  y = 45;
              } {
                  id = "Weather";
                  roundedCorners = true;
                  scale = 1.142967570256372;
                  showBackground = true;
                  x = 1118;
                  y = 384;
              } {
                  id = "plugin:calendar-widget";
                  scale = 1.4323710820047957;
                  showBackground = true;
                  x = 1695;
                  y = 262;
                  defaultSettings = {
                      roundedCorners = true;
                      showBackground = true;
                  };
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 1.3071426522512375;
                  showAlbumArt = false;
                  showBackground = true;
                  showButtons = true;
                  showVisualizer = false;
                  visualizerType = "linear";
                  x = 1118;
                  y = 262;
              } {
                  id = "plugin:catwalk";
                  scale = 1.106362479106558;
                  showBackground = true;
                  x = 1445;
                  y = 595;
                  defaultSettings = {
                      hideBackground = false;
                      minimumThreshold = 10;
                  };
              } {
                  diskPath = "/";
                  id = "SystemStat";
                  layout = "bottom";
                  roundedCorners = true;
                  scale = 1.2896928094173636;
                  showBackground = true;
                  statType = "Memory";
                  x = 1118;
                  y = 520;
              } ];
          } {
              name = "DP-3";
              widgets = [ {
                  clockColor = "none";
                  clockStyle = "digital";
                  customFont = "";
                  format = ''
          HH:mm
          d MMMM yyyy'';
                  id = "Clock";
                  roundedCorners = true;
                  scale = 1.3174091884595165;
                  showBackground = true;
                  useCustomFont = false;
                  x = 1445;
                  y = 384;
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 2.3626262995809864;
                  showAlbumArt = true;
                  showBackground = true;
                  showButtons = false;
                  showVisualizer = false;
                  visualizerType = "wave";
                  x = 1118;
                  y = 45;
              } {
                  id = "Weather";
                  roundedCorners = true;
                  scale = 1.142967570256372;
                  showBackground = true;
                  x = 1118;
                  y = 384;
              } {
                  id = "plugin:calendar-widget";
                  scale = 1.4323710820047957;
                  showBackground = true;
                  x = 1695;
                  y = 262;
                  defaultSettings = {
                      roundedCorners = true;
                      showBackground = true;
                  };
              } {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 1.3071426522512375;
                  showAlbumArt = false;
                  showBackground = true;
                  showButtons = true;
                  showVisualizer = false;
                  visualizerType = "linear";
                  x = 1118;
                  y = 262;
              } {
                  id = "plugin:catwalk";
                  scale = 1.106362479106558;
                  showBackground = true;
                  x = 1445;
                  y = 595;
                  defaultSettings = {
                      hideBackground = false;
                      minimumThreshold = 10;
                  };
              } {
                  diskPath = "/";
                  id = "SystemStat";
                  layout = "bottom";
                  roundedCorners = true;
                  scale = 1.2896928094173636;
                  showBackground = true;
                  statType = "Memory";
                  x = 1118;
                  y = 520;
              } ];
          } ];
      };
      desktop_widgets = {
          schema_version = 2;
          widget_order = [ "desktop-widget-0000000000000001" "desktop-widget-0000000000000005" ];
          grid = {
              cell_size = 16;
              major_interval = 4;
              visible = true;
          };
          widget = {
              desktop-widget-0000000000000001 = {
                  box_height = 288.0;
                  box_width = 656.0;
                  cx = 368.0;
                  cy = 218.0;
                  output = "DP-3";
                  rotation = 0.0;
                  type = "media_player";
                  settings = {
                      layout = "horizontal";
                  };
              };
              desktop-widget-0000000000000005 = {
                  box_height = 256.0;
                  box_width = 464.0;
                  cx = 3080.0;
                  cy = 1232.0;
                  output = "DP-3";
                  rotation = 0.0;
                  type = "clock";
              };
          };
      };
      dock = {
          animationSpeed = 1.5;
          auto_hide = true;
          backgroundOpacity = 0.2;
          background_opacity = 0.4999999888241291;
          colorizeIcons = false;
          deadOpacity = 0.2;
          displayMode = "auto_hide";
          dockType = "floating";
          enabled = true;
          floatingRatio = 0.5;
          groupApps = true;
          groupClickAction = "list";
          groupContextMenuMode = "extended";
          groupIndicatorStyle = "dots";
          inactiveIndicators = false;
          indicatorColor = "primary";
          indicatorOpacity = 0.2;
          indicatorThickness = 3;
          launcherIcon = "";
          launcherIconColor = "primary";
          launcherPosition = "start";
          launcherUseDistroLogo = true;
          monitors = [  ];
          onlySameOutput = true;
          pinnedApps = [  ];
          pinnedStatic = false;
          position = "bottom";
          reserve_space = false;
          showDockIndicator = true;
          showLauncherIcon = true;
          sitOnFrame = false;
          size = 1;
      };
      general = {
          allowPanelsOnScreenWithoutBar = true;
          allowPasswordWithFprintd = false;
          animationDisabled = false;
          animationSpeed = 1;
          autoStartAuth = false;
          avatarImage = "/home/gambled/Pictures/face.jpg";
          boxRadiusRatio = 1;
          clockFormat = ''
      hh
      mm'';
          clockStyle = "digital";
          compactLockScreen = false;
          dimmerOpacity = 0.2;
          enableBlurBehind = true;
          enableLockScreenCountdown = true;
          enableLockScreenMediaControls = true;
          enableShadows = false;
          forceBlackScreenCorners = false;
          iRadiusRatio = 1;
          language = "en";
          lockOnSuspend = true;
          lockScreenAnimations = true;
          lockScreenBlur = 1;
          lockScreenCountdownDuration = 10000;
          lockScreenMonitors = [  ];
          lockScreenTint = 0.5;
          passwordChars = true;
          radiusRatio = 1;
          reverseScroll = false;
          scaleRatio = 1;
          screenRadiusRatio = 1;
          shadowDirection = "center";
          shadowOffsetX = 0;
          shadowOffsetY = 0;
          showChangelogOnStartup = true;
          showHibernateOnLockScreen = false;
          showScreenCorners = false;
          showSessionButtonsOnLockScreen = false;
          smoothScrollEnabled = true;
          telemetryEnabled = false;
          keybinds = {
              keyDown = [ "Down" ];
              keyEnter = [ "Return" "Enter" ];
              keyEscape = [ "Esc" ];
              keyLeft = [ "Left" ];
              keyRemove = [ "Del" ];
              keyRight = [ "Right" ];
              keyUp = [ "Up" ];
          };
      };
      hooks = {
          colorGeneration = "";
          darkModeChange = "";
          enabled = false;
          performanceModeDisabled = "";
          performanceModeEnabled = "";
          screenLock = "";
          screenUnlock = "";
          session = "";
          startup = "";
          wallpaperChange = "";
      };
      idle = {
          customCommands = "[]";
          enabled = true;
          fadeDuration = 30;
          lockCommand = "";
          lockTimeout = 3600;
          resumeLockCommand = "";
          resumeScreenOffCommand = "";
          resumeSuspendCommand = "";
          screenOffCommand = "";
          screenOffTimeout = 1800;
          suspendCommand = "";
          suspendTimeout = 7200;
      };
      location = {
          analogClockInCalendar = false;
          autoLocate = false;
          auto_locate = true;
          firstDayOfWeek = -1;
          hideWeatherCityName = false;
          hideWeatherTimezone = false;
          name = "Zapopan";
          showCalendarEvents = true;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = false;
          useFahrenheit = false;
          weatherEnabled = true;
          weatherShowEffects = true;
          weatherTaliaMascotAlways = false;
      };
      lockscreen = {
          blurred_desktop = true;
      };
      lockscreen_widgets = {
          enabled = true;
          schema_version = 2;
          widget_order = [ "lockscreen-login-box@DP-3" "lockscreen-widget-0000000000000001" "lockscreen-widget-0000000000000002" ];
          grid = {
              cell_size = 16;
              major_interval = 4;
              visible = true;
          };
          widget = {
              "lockscreen-login-box@DP-3" = {
                  box_height = 70.0;
                  box_width = 400.0;
                  cx = 1720.0;
                  cy = 1321.0;
                  output = "DP-3";
                  rotation = 0.0;
                  type = "login_box";
                  settings = {
                      background_color = "surface_variant";
                      background_opacity = 0.88;
                      background_radius = 12.0;
                      input_opacity = 1.0;
                      input_radius = 6.0;
                      show_login_button = true;
                  };
              };
              lockscreen-widget-0000000000000001 = {
                  box_height = 240.0;
                  box_width = 496.0;
                  cx = 1720.0;
                  cy = 584.0;
                  output = "DP-3";
                  rotation = 0.0;
                  type = "clock";
              };
              lockscreen-widget-0000000000000002 = {
                  box_height = 160.0;
                  box_width = 368.0;
                  cx = 1720.0;
                  cy = 816.0;
                  output = "DP-3";
                  rotation = 0.0;
                  type = "media_player";
              };
          };
      };
      network = {
          bluetoothAutoConnect = true;
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          bluetoothRssiPollIntervalMs = 10000;
          bluetoothRssiPollingEnabled = false;
          disableDiscoverability = false;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
      };
      nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = true;
          forced = false;
          nightTemp = "4000";
      };
      nightlight = {
          enabled = true;
      };
      noctaliaPerformance = {
          disableDesktopWidgets = true;
          disableWallpaper = false;
      };
      notification = {
          background_opacity = 0.29999999329447746;
          position = "top_center";
      };
      notifications = {
          backgroundOpacity = 0.2;
          clearDismissed = true;
          criticalUrgencyDuration = 15;
          density = "comfortable";
          enableBatteryToast = true;
          enableKeyboardLayoutToast = false;
          enableMarkdown = true;
          enableMediaToast = false;
          enabled = true;
          location = "top";
          lowUrgencyDuration = 3;
          monitors = [ "DP-3" "HDMI-A-1" "sunshine" ];
          normalUrgencyDuration = 8;
          overlayLayer = true;
          respectExpireTimeout = false;
          saveToHistory = {
              critical = true;
              low = true;
              normal = true;
          };
          sounds = {
              criticalSoundFile = "";
              enabled = true;
              excludedApps = "discord,firefox,chrome,chromium,edge";
              lowSoundFile = "";
              normalSoundFile = "";
              separateSounds = false;
              volume = 0.5;
          };
      };
      osd = {
          autoHideMs = 3000;
          backgroundOpacity = 0.2;
          background_opacity = 0.29999999329447746;
          enabled = true;
          enabledTypes = [ 0 1 2 ];
          location = "right";
          monitors = [  ];
          overlayLayer = true;
          position_vertical = "center_right";
      };
      plugins = {
          autoUpdate = true;
          enabled = [ "noctalia/wallhaven" ];
          notifyUpdates = true;
      };
      sessionMenu = {
          countdownDuration = 5000;
          enableCountdown = true;
          largeButtonsLayout = "grid";
          largeButtonsStyle = false;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          powerOptions = [ {
              action = "lock";
              enabled = true;
              keybind = "1";
          } {
              action = "suspend";
              enabled = true;
              keybind = "2";
          } {
              action = "hibernate";
              enabled = true;
              keybind = "3";
          } {
              action = "reboot";
              enabled = true;
              keybind = "4";
          } {
              action = "logout";
              enabled = true;
              keybind = "5";
          } {
              action = "shutdown";
              enabled = true;
              keybind = "6";
          } ];
      };
      shell = {
          app_icon_color = "secondary";
          avatar_path = "/home/gambled/Pictures/face.jpg";
          corner_radius_scale = 1.1000000163912773;
          font_family = "DejaVu Sans";
          launch_apps_as_systemd_services = true;
          password_style = "random";
          polkit_agent = true;
          screen_time_enabled = true;
          settings_show_advanced = true;
          ui_scale = 1.0000000074505806;
          animation = {
              speed = 1.2500000186264515;
          };
          panel = {
              transparency_mode = "soft";
          };
      };
      systemMonitor = {
          batteryCriticalThreshold = 5;
          batteryWarningThreshold = 20;
          cpuCriticalThreshold = 90;
          cpuWarningThreshold = 80;
          criticalColor = "";
          diskAvailCriticalThreshold = 10;
          diskAvailWarningThreshold = 20;
          diskCriticalThreshold = 90;
          diskWarningThreshold = 80;
          enableDgpuMonitoring = false;
          externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
          gpuCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          memCriticalThreshold = 90;
          memWarningThreshold = 80;
          swapCriticalThreshold = 90;
          swapWarningThreshold = 80;
          tempCriticalThreshold = 90;
          tempWarningThreshold = 80;
          useCustomColors = false;
          warningColor = "";
      };
      templates = {
          enableUserTheming = true;
          activeTemplates = [ {
              enabled = true;
              id = "ghostty";
          } {
              enabled = true;
              id = "yazi";
          } {
              enabled = true;
              id = "btop";
          } {
              enabled = true;
              id = "gtk";
          } {
              enabled = true;
              id = "spicetify";
          } {
              enabled = true;
              id = "kcolorscheme";
          } {
              enabled = true;
              id = "qt";
          } {
              enabled = true;
              id = "code";
          } {
              enabled = true;
              id = "hyprland";
          } {
              enabled = true;
              id = "alacritty";
          } {
              enabled = true;
              id = "starship";
          } {
              enabled = true;
              id = "discord";
          } {
              enabled = true;
              id = "vicinae";
          } {
              enabled = true;
              id = "steam";
          } {
              enabled = true;
              id = "hyprtoolkit";
          } {
              enabled = true;
              id = "zed";
          } {
              enabled = true;
              id = "mango";
          } ];
      };
      theme = {
          builtin = "Catppuccin";
          mode = "dark";
          source = "wallpaper";
          wallpaper_scheme = "m3-content";
          templates = {
              builtin_ids = [ "btop" "gtk3" "gtk4" "ghostty" "hyprland" "kcolorscheme" "kitty" "mango" "niri" "qt" "starship" ];
              community_ids = [ "spicetify" "neovim" "vscode" "zed" "vicinae" "discord" "steam" "yazi" "hyprtoolkit" ];
          };
      };
      ui = {
          boxBorderEnabled = false;
          fontDefault = "DejaVu Sans";
          fontDefaultScale = 1;
          fontFixed = "DejaVu Sans Mono";
          fontFixedScale = 1;
          panelBackgroundOpacity = 0.4;
          panelsAttachedToBar = true;
          scrollbarAlwaysVisible = false;
          settingsPanelMode = "attached";
          settingsPanelSideBarCardStyle = true;
          tooltipsEnabled = true;
          translucentWidgets = false;
      };
      wallpaper = {
          automationEnabled = false;
          directory = "/home/gambled/Pictures/Wallpapers";
          enableMultiMonitorDirectories = false;
          enabled = true;
          favorites = [  ];
          fillColor = "#000000";
          fillMode = "fill";
          hideWallpaperFilenames = false;
          linkLightAndDarkWallpapers = true;
          monitorDirectories = [  ];
          overviewBlur = 0.4;
          overviewEnabled = true;
          overviewTint = 0.6;
          panelPosition = "follow_bar";
          per_monitor_directories = true;
          randomIntervalSec = 300;
          setWallpaperOnAllMonitors = false;
          showHiddenFiles = false;
          skipStartupTransition = true;
          solidColor = "#1a1a2e";
          sortOrder = "name";
          transitionDuration = 1500;
          transitionEdgeSmoothness = 0.05;
          transitionType = [ "fade" "disc" "stripes" "wipe" "pixelate" "honeycomb" ];
          transition_on_startup = true;
          useOriginalImages = false;
          useSolidColor = false;
          useWallhaven = false;
          viewMode = "single";
          wallhavenApiKey = "";
          wallhavenCategories = "111";
          wallhavenOrder = "desc";
          wallhavenPurity = "100";
          wallhavenQuery = "";
          wallhavenRatios = "";
          wallhavenResolutionHeight = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenSorting = "relevance";
          wallpaperChangeMode = "random";
          automation = {
              enabled = true;
              interval_seconds = 86400;
          };
          default = {
              path = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_lyql6p.jpg";
          };
          last = {
              path = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_lyql6p.jpg";
          };
          monitor = {
              DP-3 = {
                  directory = "/home/gambled/Pictures/Wallpapers/Ultrawide";
              };
          };
          monitors = {
              DP-3 = {
                  path = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_lyql6p.jpg";
              };
          };
      };
      widget = {
          media = {
              anchor = true;
              title_scroll = "on_hover";
          };
          tray = {
              capsule = true;
              drawer = true;
          };
          vicinae = {
              capsule = true;
              capsule_padding = 3.0;
              command = "vicinae toggle";
              glyph = "rocket";
              right_command = "vicinae toggle";
              type = "custom_button";
          };
          wallhaven = {
              type = "noctalia/wallhaven:wallhaven";
          };
          workspaces = {
              capsule = true;
              minimal = true;
          };
      };
  };
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    customPalettes = {
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

    settings = noctalia_settings;
  };

  home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
    text = builtins.toJSON {
      defaultWallpaper = "/etc/nixos/wallpaper.jpg";
      wallpapers = {
        "DP-3" = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_lyql6p.jpg";
        "sunshine" = "/home/gambled/Pictures/Wallpapers/Wide/irl/ferns-green.jpg";
        "HDMI-A-1" = "/home/gambled/Pictures/Wallpapers/Wide/vibrant/wallhaven_yj96lx.jpg";
        "eDP-1" = "/home/gambled/Pictures/Wallpapers/Wide/vibrant/wallhaven_yj96lx.jpg";
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
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
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
