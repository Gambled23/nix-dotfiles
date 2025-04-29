{ config, lib, pkgs, ... }:

with lib;

{
  services.desktopManager.plasma6.enable = true;

  services.displayManager = {
    autoLogin.enable = false;
    autoLogin.user = "gambled";
    sddm = {
      enable = true;
      autoNumlock = true;
      # theme = "breeze";
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
    plasma-panel-colorizer
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
    #kdePackages.kdenlive
    kdePackages.merkuro
    kdePackages.kclock
    kdePackages.kalk
    kdePackages.qtstyleplugin-kvantum
    gruvbox-kvantum
    libportal-qt6
    qt6.qtwebsockets
    qt6.qtwebengine
    kdePackages.dolphin-plugins
    kdePackages.kate
    kdePackages.qtwayland

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

  qt.style = "kvantum";

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
