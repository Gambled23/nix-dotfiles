{ config, lib, pkgs, ... }:

with lib;

{
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

    # Enable libinput driver for improved touchpad support (enabled by default in most desktop environments).
    libinput.enable = true;

    desktopManager = {
      plasma5.enable = true;
    };

    displayManager = {
      #sddm = {
      #  enable = false;
      #  autoNumlock = true;
      #};
      defaultSession = "plasmawayland";
    };
  };

  #---------------------------------------------------------------------
  # System Packages Configuration
  #---------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    libsForQt5.plasma-browser-integration
    libsForQt5.kaccounts-integration
    libsForQt5.kaccounts-providers
    libsForQt5.packagekit-qt
    libsForQt5.kaccounts-integration
    libsForQt5.kaccounts-providers
    libsForQt5.signond
    libsForQt5.qoauth
    libsForQt5.kio-gdrive
    libsForQt5.ktorrent
    libsForQt5.libktorrent
    libsForQt5.discover
    libsForQt5.packagekit-qt
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.bismuth
    libportal-qt5

    gparted
    kate
    kup
  ];

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