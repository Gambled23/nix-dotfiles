{ config, lib, pkgs, ... }:

with lib;

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "gambled";
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
    };
  };

  services.xserver = {
    # Scaling factor for fonts and graphical elements on the screen
    dpi = 98;
    enable = true;
    exportConfiguration = true;

    # keyboard layout
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    #DM
    displayManager = { 
      # lightdm = { 
      #   enable = true; 
      #   greeter.enable = false;
      #   extraConfig = "logind-check-graphical=true";
      # }; 
    };
  };

  #---------------------------------------------------------------------
  # System Packages Configuration
  #---------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    kde-rounded-corners
    kdePackages.krohnkite
    kdePackages.plasma-browser-integration
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.packagekit-qt
    kdePackages.signond
    kdePackages.krfb
    kdePackages.krdc
    kdePackages.kio-gdrive
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.ktorrent
    kdePackages.libktorrent
    # kdePackages.kdenlive
    # kdePackages.merkuro
    kdePackages.kclock
    kdePackages.kalk
    # kdePackages.qtstyleplugin-kvantum
    # libportal-qt6
    kdePackages.dolphin-plugins
    kdePackages.kate
    kdePackages.qtwayland

    # Themes
    #kdePackages.kde-gtk-config
    #kdePackages.breeze-gtk

    #kde-gruvbox
    #kdePackages.koi
    # graphite-kde-theme
    # vimix-cursors
    bibata-cursors
    # gruvbox-kvantum
    # nordic
    # qogir-kde

    # widgets
    plasmusic-toolbar
    plasma-panel-colorizer
    headsetcontrol
    plasma-applet-commandoutput

    #krunner plugins
    vscode-runner

    # Screensharing
    pipewire
    wireplumber
  ];

  # qt.style = "kvantum";

  programs.partition-manager.enable = true;
  programs.kdeconnect.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPorts = [
          # Moonlight
          5353
          47998
          47999
          48000
          48002
          48010
          # Miracast
          7236
          5353
        ];
    allowedTCPPorts = [
          # MoonDeck Buddy
          59999
          # Moonlight
          47984
          47989
          48010
          # Miracast
          7236
          7250
        ];
  };
}
