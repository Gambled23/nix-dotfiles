{ config, lib, pkgs, ... }:

with lib;

{
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    systemd.restartIfChanged = true;
    enableVPN = true;
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableClipboardPaste = true;
    enableCalendarEvents = true;
    enableAudioWavelength = true;
    settings = {
      currentThemeName = "dynamic";
      currentThemeCategory = "dynamic";
      customThemeFile = "";
      registryThemeVariants = {
      
      };
      matugenScheme = "scheme-tonal-spot";
      runUserMatugenTemplates = true;
      matugenTargetMonitor = "";
      popupTransparency = 0.8;
      dockTransparency = 0.6;
      widgetBackgroundColor = "sch";
      widgetColorMode = "colorful";
      controlCenterTileColorMode = "primary";
      buttonColorMode = "primary";
      cornerRadius = 12;
      niriLayoutGapsOverride = (-1);
      niriLayoutRadiusOverride = (-1);
      niriLayoutBorderSize = (-1);
      hyprlandLayoutGapsOverride = (-1);
      hyprlandLayoutRadiusOverride = (-1);
      hyprlandLayoutBorderSize = (-1);
      mangoLayoutGapsOverride = (-1);
      mangoLayoutRadiusOverride = (-1);
      mangoLayoutBorderSize = (-1);
      use24HourClock = true;
      showSeconds = false;
      padHours12Hour = false;
      useFahrenheit = false;
      windSpeedUnit = "kmh";
      nightModeEnabled = false;
      animationSpeed = 1;
      customAnimationDuration = 500;
      syncComponentAnimationSpeeds = true;
      popoutAnimationSpeed = 1;
      popoutCustomAnimationDuration = 150;
      modalAnimationSpeed = 1;
      modalCustomAnimationDuration = 150;
      enableRippleEffects = true;
      blurEnabled = false;
      blurForegroundLayers = true;
      blurLayerOutlineOpacity = 0.12;
      blurBorderColor = "outline";
      blurBorderCustomColor = "#ffffff";
      blurBorderOpacity = 0.35;
      wallpaperFillMode = "Fill";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [
      
      ];
      showSystemTray = true;
      systemTrayIconTintMode = "primary";
      systemTrayIconTintSaturation = 25;
      systemTrayIconTintStrength = 50;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowAudioPercent = false;
      controlCenterShowVpnIcon = true;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowBrightnessPercent = false;
      controlCenterShowMicIcon = false;
      controlCenterShowMicPercent = false;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;
      controlCenterShowScreenSharingIcon = true;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;
      controlCenterWidgets = [
        {
          enabled = true;
          id = "volumeSlider";
          width = 50;
        }
        {
          enabled = true;
          id = "brightnessSlider";
          width = 50;
        }
        {
          enabled = true;
          id = "wifi";
          width = 50;
        }
        {
          enabled = true;
          id = "bluetooth";
          width = 50;
        }
        {
          enabled = true;
          id = "audioOutput";
          width = 50;
        }
        {
          enabled = true;
          id = "audioInput";
          width = 50;
        }
        {
          enabled = true;
          id = "nightMode";
          width = 50;
        }
        {
          enabled = true;
          id = "darkMode";
          width = 50;
        }
      ];
      showWorkspaceIndex = true;
      showWorkspaceName = false;
      showWorkspacePadding = false;
      workspaceScrolling = false;
      showWorkspaceApps = false;
      workspaceDragReorder = true;
      maxWorkspaceIcons = 3;
      workspaceAppIconSizeOffset = 0;
      groupWorkspaceApps = true;
      workspaceFollowFocus = false;
      showOccupiedWorkspacesOnly = false;
      reverseScrolling = false;
      dwlShowAllTags = false;
      workspaceColorMode = "default";
      workspaceOccupiedColorMode = "none";
      workspaceUnfocusedColorMode = "default";
      workspaceUrgentColorMode = "default";
      workspaceFocusedBorderEnabled = false;
      workspaceFocusedBorderColor = "primary";
      workspaceFocusedBorderThickness = 2;
      workspaceNameIcons = {
      
      };
      waveProgressEnabled = true;
      scrollTitleEnabled = true;
      audioVisualizerEnabled = true;
      audioScrollMode = "volume";
      audioWheelScrollAmount = 1;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      barMaxVisibleApps = 0;
      barMaxVisibleRunningApps = 0;
      barShowOverflowBadge = true;
      appsDockHideIndicators = false;
      appsDockColorizeActive = false;
      appsDockActiveColorMode = "primary";
      appsDockEnlargeOnHover = false;
      appsDockEnlargePercentage = 125;
      appsDockIconSizePercentage = 100;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = true;
      runningAppsGroupByApp = false;
      runningAppsCurrentMonitor = false;
      appIdSubstitutions = [
        {
          pattern = "Spotify";
          replacement = "spotify";
          type = "exact";
        }
        {
          pattern = "beepertexts";
          replacement = "beeper";
          type = "exact";
        }
        {
          pattern = "home assistant desktop";
          replacement = "homeassistant-desktop";
          type = "exact";
        }
        {
          pattern = "com.transmissionbt.transmission";
          replacement = "transmission-gtk";
          type = "contains";
        }
        {
          pattern = "^steam_app_(\\d+)$";
          replacement = "steam_icon_$1";
          type = "regex";
        }
      ];
      centeringMode = "geometric";
      clockDateFormat = "d/M";
      lockDateFormat = "ddd MMM d";
      greeterRememberLastSession = true;
      greeterRememberLastUser = true;
      greeterEnableFprint = false;
      greeterEnableU2f = false;
      greeterWallpaperPath = "";
      greeterUse24HourClock = true;
      greeterShowSeconds = false;
      greeterPadHours12Hour = false;
      greeterLockDateFormat = "";
      greeterFontFamily = "";
      greeterWallpaperFillMode = "";
      mediaSize = 1;
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      browserPickerViewMode = "grid";
      browserUsageHistory = {
      
      };
      appPickerViewMode = "grid";
      filePickerUsageHistory = {
      
      };
      sortAppsAlphabetically = true;
      appLauncherGridColumns = 4;
      spotlightCloseNiriOverview = true;
      spotlightSectionViewModes = {
      
      };
      appDrawerSectionViewModes = {
      
      };
      niriOverviewOverlayEnabled = true;
      dankLauncherV2Size = "compact";
      dankLauncherV2BorderEnabled = false;
      dankLauncherV2BorderThickness = 2;
      dankLauncherV2BorderColor = "primary";
      dankLauncherV2ShowFooter = true;
      dankLauncherV2UnloadOnClose = false;
      useAutoLocation = false;
      weatherEnabled = true;
      networkPreference = "auto";
      iconTheme = "Bibata-Modern-Ice";
      cursorSettings = {
        dwl = {
          cursorHideTimeout = 0;
        };
        hyprland = {
          hideOnKeyPress = true;
          hideOnTouch = true;
          inactiveTimeout = 0;
        };
        niri = {
          hideAfterInactiveMs = 0;
          hideWhenTyping = false;
        };
        size = 24;
        theme = "Bibata-Modern-Ice";
      };
      launcherLogoMode = "os";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "primary";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 0;
      fontFamily = "DejaVu Sans";
      monoFontFamily = "DejaVu Sans Mono";
      fontWeight = 400;
      fontScale = 1;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = (-1);
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 0;
      acLockTimeout = 0;
      acSuspendTimeout = 0;
      acSuspendBehavior = 0;
      acProfileName = "";
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      batteryProfileName = "";
      batteryChargeLimit = 100;
      lockBeforeSuspend = false;
      loginctlLockIntegration = true;
      fadeToLockEnabled = true;
      fadeToLockGracePeriod = 5;
      fadeToDpmsEnabled = true;
      fadeToDpmsGracePeriod = 5;
      launchPrefix = "";
      brightnessDevicePins = {
      
      };
      wifiNetworkPins = {
      
      };
      bluetoothDevicePins = {
        preferredDevice = [
          "84:AC:60:94:B5:52"
        ];
      };
      audioInputDevicePins = {
      
      };
      audioOutputDevicePins = {
      
      };
      gtkThemingEnabled = true;
      qtThemingEnabled = true;
      syncModeWithPortal = true;
      terminalsAlwaysDark = false;
      runDmsMatugenTemplates = true;
      matugenTemplateGtk = true;
      matugenTemplateNiri = true;
      matugenTemplateHyprland = true;
      matugenTemplateMangowc = true;
      matugenTemplateQt5ct = true;
      matugenTemplateQt6ct = true;
      matugenTemplateFirefox = true;
      matugenTemplatePywalfox = true;
      matugenTemplateZenBrowser = true;
      matugenTemplateVesktop = true;
      matugenTemplateEquibop = true;
      matugenTemplateGhostty = true;
      matugenTemplateKitty = true;
      matugenTemplateFoot = true;
      matugenTemplateAlacritty = true;
      matugenTemplateNeovim = true;
      matugenTemplateWezterm = true;
      matugenTemplateDgop = true;
      matugenTemplateKcolorscheme = true;
      matugenTemplateVscode = true;
      matugenTemplateEmacs = true;
      matugenTemplateZed = true;
      showDock = true;
      dockAutoHide = false;
      dockSmartAutoHide = true;
      dockGroupByApp = true;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 15;
      dockIconSize = 36;
      dockIndicatorStyle = "circle";
      dockBorderEnabled = false;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 1;
      dockBorderThickness = 1;
      dockIsolateDisplays = true;
      dockLauncherEnabled = true;
      dockLauncherLogoMode = "os";
      dockLauncherLogoCustomPath = "";
      dockLauncherLogoColorOverride = "";
      dockLauncherLogoSizeOffset = 0;
      dockLauncherLogoBrightness = 0.5;
      dockLauncherLogoContrast = 1;
      dockMaxVisibleApps = 0;
      dockMaxVisibleRunningApps = 0;
      dockShowOverflowBadge = true;
      notificationOverlayEnabled = true;
      notificationPopupShadowEnabled = true;
      notificationPopupPrivacyMode = false;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = true;
      lockScreenShowSystemIcons = true;
      lockScreenShowTime = true;
      lockScreenShowDate = true;
      lockScreenShowProfileImage = true;
      lockScreenShowPasswordField = true;
      lockScreenShowMediaPlayer = true;
      lockScreenPowerOffMonitorsOnLock = false;
      lockAtStartup = false;
      enableFprint = false;
      maxFprintTries = 15;
      enableU2f = false;
      u2fMode = "or";
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";
      lockScreenNotificationMode = 2;
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationCompactMode = true;
      notificationPopupPosition = (-1);
      notificationAnimationSpeed = 1;
      notificationCustomAnimationDuration = 400;
      notificationHistoryEnabled = true;
      notificationHistoryMaxCount = 50;
      notificationHistoryMaxAgeDays = 7;
      notificationHistorySaveLow = true;
      notificationHistorySaveNormal = true;
      notificationHistorySaveCritical = true;
      notificationRules = [
      
      ];
      osdAlwaysShowValue = false;
      osdPosition = 5;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdMediaPlaybackEnabled = false;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;
      powerActionConfirm = true;
      powerActionHoldDuration = 0.5;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      customPowerActionLock = "";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterHideWidget = false;
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      displayNameMode = "system";
      screenPreferences = {
        wallpaper = [
          "all"
        ];
      };
      showOnLastDisplay = {
      
      };
      niriOutputSettings = {
      
      };
      hyprlandOutputSettings = {
      
      };
      displayProfiles = {
      
      };
      activeDisplayProfile = {
      
      };
      displayProfileAutoSelect = false;
      displayShowDisconnected = false;
      displaySnapToEdge = true;
      barConfigs = [
        {
          autoHide = false;
          autoHideDelay = 250;
          borderColor = "surfaceText";
          borderEnabled = false;
          borderOpacity = 1;
          borderThickness = 1;
          bottomGap = 0;
          centerWidgets = [
            {
              enabled = true;
              id = "music";
            }
            {
              enabled = true;
              id = "discordVoice";
            }
          ];
          clickThrough = false;
          enabled = true;
          fontScale = 1;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 64;
          gothCornersEnabled = true;
          id = "default";
          innerPadding = 4;
          leftWidgets = [
            {
              enabled = true;
              id = "launcherButton";
            }
            {
              enabled = true;
              id = "clock";
            }
            {
              enabled = true;
              id = "workspaceSwitcher";
            }
            {
              enabled = true;
              id = "usbManager";
            }
          ];
          maximizeWidgetIcons = false;
          name = "Main Bar";
          noBackground = false;
          openOnOverview = false;
          popupGapsAuto = true;
          popupGapsManual = 4;
          position = 0;
          removeWidgetPadding = false;
          rightWidgets = [
            {
              enabled = true;
              id = "dankKDEConnect";
            }
            {
              enabled = true;
              id = "systemTray";
            }
            {
              enabled = true;
              id = "volumeMixer";
            }
            {
              enabled = true;
              id = "battery";
            }
            {
              enabled = true;
              id = "notificationButton";
            }
            {
              enabled = true;
              id = "controlCenterButton";
              showAudioPercent = false;
              showBatteryIcon = false;
            }
          ];
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          spacing = 0;
          squareCorners = true;
          transparency = 0.6;
          visible = true;
          widgetTransparency = 1;
        }
      ];
      desktopClockEnabled = false;
      desktopClockStyle = "analog";
      desktopClockTransparency = 0.8;
      desktopClockColorMode = "primary";
      desktopClockCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = (-1);
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = (-1);
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      desktopClockShowDate = true;
      desktopClockShowAnalogNumbers = false;
      desktopClockShowAnalogSeconds = true;
      desktopClockX = (-1);
      desktopClockY = (-1);
      desktopClockWidth = 280;
      desktopClockHeight = 180;
      desktopClockDisplayPreferences = [
        "all"
      ];
      systemMonitorEnabled = false;
      systemMonitorShowHeader = true;
      systemMonitorTransparency = 0.8;
      systemMonitorColorMode = "primary";
      systemMonitorCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = (-1);
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = (-1);
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      systemMonitorShowCpu = true;
      systemMonitorShowCpuGraph = true;
      systemMonitorShowCpuTemp = true;
      systemMonitorShowGpuTemp = false;
      systemMonitorGpuPciId = "";
      systemMonitorShowMemory = true;
      systemMonitorShowMemoryGraph = true;
      systemMonitorShowNetwork = true;
      systemMonitorShowNetworkGraph = true;
      systemMonitorShowDisk = true;
      systemMonitorShowTopProcesses = false;
      systemMonitorTopProcessCount = 3;
      systemMonitorTopProcessSortBy = "cpu";
      systemMonitorGraphInterval = 60;
      systemMonitorLayoutMode = "auto";
      systemMonitorX = (-1);
      systemMonitorY = (-1);
      systemMonitorWidth = 320;
      systemMonitorHeight = 480;
      systemMonitorDisplayPreferences = [
        "all"
      ];
      systemMonitorVariants = [
      
      ];
      desktopWidgetPositions = {
      
      };
      desktopWidgetGridSettings = {
      
      };
      desktopWidgetInstances = [
        {
          config = {
            colorMode = "primary";
            customColor = "#ffffff";
            displayPreferences = [
              {
                model = "0x1618";
                name = "eDP-1";
              }
            ];
            gpuPciId = "";
            graphInterval = 60;
            layoutMode = "auto";
            showCpu = true;
            showCpuGraph = true;
            showCpuTemp = true;
            showDisk = true;
            showGpuTemp = true;
            showHeader = true;
            showMemory = true;
            showMemoryGraph = true;
            showNetwork = true;
            showNetworkGraph = true;
            showTopProcesses = true;
            topProcessCount = 3;
            topProcessSortBy = "cpu";
            transparency = 0.8;
          };
          enabled = true;
          id = "dw_1777310824911_teaguxvuv";
          name = "System Monitor";
          positions = {
            HDMI-A-1 = {
              height = 480;
              width = 320;
              x = 236.86328125;
              y = 166.46484375;
            };
            eDP-1 = {
              height = 527.8203125;
              width = 701.94921875;
              x = 0;
              y = 672.1796875;
            };
          };
          widgetType = "systemMonitor";
        }
        {
          config = {
            colorMode = "primary";
            customColor = "#ffffff";
            displayPreferences = [
              "all"
            ];
            showAnalogNumbers = false;
            showAnalogSeconds = true;
            showDate = true;
            showOnOverlay = false;
            style = "analog";
            transparency = 0.7;
          };
          enabled = true;
          id = "dw_1777310827092_9qci34nkt";
          name = "Desktop Clock";
          positions = {
            HDMI-A-1 = {
              height = 416.09375;
              width = 416.09375;
              x = 1503.90625;
              y = 40.96484375;
            };
            eDP-1 = {
              height = 487.90625;
              width = 487.90625;
              x = 0.109375;
              y = 44.11328125;
            };
          };
          widgetType = "desktopClock";
        }
        {
          id = "dw_1777328235435_gpl786lqf";
          widgetType = "dankDesktopWeather";
          name = "Dank Desktop Weather";
          enabled = true;
          config = {
            displayPreferences = [
              {
                name = "eDP-1";
                model = "0x1618";
              }
            ];
            viewMode = "detailed";
            showPressure = true;
            showHourlyForecast = true;
            hourlyCount = 12;
          };
          positions = {
            eDP-1 = {
              width = 747.7890625;
              height = 529.7109375;
              x = 1172.2109375;
              y = 670.2890625;
            };
            HDMI-A-1 = {
              width = 292.9296875;
              height = 291.4375;
              x = 309.45703125;
              y = 636.58984375;
            };
          };
        }
        {
          id = "dw_1777328238920_6zg9yppl4";
          widgetType = "mediaPlayer";
          name = "Media Player";
          enabled = true;
          config = {
            displayPreferences = [
              {
                name = "eDP-1";
                model = "0x1618";
              }
            ];
            showOnOverlay = false;
            borderOpacity = 0;
            rotateThumbnail = true;
          };
          positions = {
            eDP-1 = {
              width = 458.7578125;
              height = 195.7890625;
              x = 708.0859375;
              y = 669.90625;
            };
            HDMI-A-1 = {
              width = 558.3671875;
              height = 215.1953125;
              x = 1348.45703125;
              y = 56.7421875;
            };
          };
        }
      ];
      desktopWidgetGroups = [
      
      ];
      builtInPluginSettings = {
        dms_settings_search = {
          trigger = "?";
        };
      };
      clipboardEnterToPaste = false;
      launcherPluginVisibility = {
      
      };
      launcherPluginOrder = [
      
      ];
      configVersion = 5;
    };

    plugins = {
      volumeMixer.enable = true;
      usbManager.enable = true;
      discordVoice.enable = true;
      amdGpuMonitor.enable = true;
      mediaPlayer.enable = true;
      # ssshMonitor.enable = true;
      # dankDesktopWeather.enable = true;
    };
  };
}
