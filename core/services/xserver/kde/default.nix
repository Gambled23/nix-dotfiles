{ config, lib, pkgs, ... }:

with lib;

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    # theme = "breeze";
    wayland.enable = true;
    wayland.compositor = "kwin";
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
  };

  #---------------------------------------------------------------------
  # System Packages Configuration
  #---------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    kde-rounded-corners
    kdePackages.plasma-browser-integration
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.packagekit-qt
    kdePackages.signond
    libsForQt5.qoauth
    kdePackages.krfb
    kdePackages.krdc
    kdePackages.kio-gdrive
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.ktorrent
    kdePackages.libktorrent
    kdePackages.kdenlive
    kdePackages.merkuro
    kdePackages.kclock
    kdePackages.kalk
    qt6Packages.qtstyleplugin-kvantum
    libportal-qt5
    qt6.qtwebengine
    kdePackages.dolphin-plugins
    kate
    kup

    # Themes
    #kdePackages.kde-gtk-config
    #kdePackages.breeze-gtk

    #kde-gruvbox
    #kdePackages.koi
    #graphite-kde-theme
    vimix-cursors

    # widgets
    plasmusic-toolbar
  ];

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
  };
}
