{ self, inputs, config, lib, pkgs, ... }:
{
  flake.homeModules.duxShell = { pkgs, ... }:
  let
    duxSettings = import ./_Settings.nix;
  in
  {
    imports = [
      inputs.dms.homeModules.default
      inputs.dms-plugin-registry.nixosModules.default
      inputs.dux-files.homeModules.default
      inputs.dux-calendar.homeModules.default
    ];

    home.packages = with pkgs; [
      adw-gtk3
      grim
      qt6Packages.qt5compat
      qt6Packages.qtwebsockets
    ];

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
      settings = lib.mkForce duxSettings;

      plugins = {
        volumeMixer.enable = true;
        usbManager.enable = true;
        mediaPlayer.enable = true;  
        dankKDEConnect.enable = true;
        screencastPicker.enable = true;
        # ssshMonitor.enable = true;
        # dankDesktopWeather.enable = true;
        homeAssistantMonitor.enable = true;
        homeAssistantDash.enable = true;
        mangoWmLayoutManager.enable = true;
        materialWeather.enable = true;
        materialPlayer.enable = true;
        lainWidget.enable = true;
        hiddenBar.enable = true;
        systemMonitorPlus.enable = true;
        cast.enable = true;
        clipboardPlus.enable = true;
        dankscale.enable = true;
        dankActions.enable = true;
        orbitBluetooth.enable = true;
        dmsScreenshot.enable = true;
      };
    };

    programs.dux-files = {
      enable = true;

      # Keep a resident instance so windows open fast and the portal answers at once
      systemd = {
        enable = true;
        target = "graphical-session.target";
        restartIfChanged = true;
      };

      # Serve other apps' open and save dialogs
      portal = {
        enable = true;      # register the dfiles backend with xdg-desktop-portal
        preferred = true;   # prefer it for org.freedesktop.impl.portal.FileChooser
      };
      package = pkgs.dux-files;

      # settings = {
      #   defaultView = "grid";
      #   vimKeys = true;
      # };
    };

    programs.dank-calendar = {
      enable = true;
      systemd = {
        enable = true;
        target = "graphical-session.target";
        restartIfChanged = true;
      };
      package = pkgs.dux-calendar;
    };
  };
}
