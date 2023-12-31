{ config, lib, pkgs, ... }:

with lib;

{
  #---------------------------------------------------------------------
  # X11 Server and KDE Plasma Desktop Environment Configuration
  #---------------------------------------------------------------------
  services.xserver = {
    # Scaling factor for fonts and graphical elements on the screen
    dpi = 98;
    enable = true;
    exportConfiguration = true;

    # keymap
    layout = "us";
    xkbVariant = "altgr-intl";

    # Enable libinput driver for improved touchpad support (enabled by default in most desktop environments).
    libinput.enable = true;

    #---------------------------------------------------------------------
    # Desktop Manager Configuration
    #---------------------------------------------------------------------
    desktopManager = {
      plasma5.enable = true;

    };

    #---------------------------------------------------------------------
    # Desktop Manager login screen settings
    #---------------------------------------------------------------------
    displayManager = {
      #sddm = {
      #  enable = false;
      #  autoNumlock = true;
      #};
      defaultSession = "plasmawayland";
    };

    # ---------------------------------------------------------------------
    # Video settings that go hand-in-hand with OpenGL
    # ---------------------------------------------------------------------
    # videoDrivers = [
    #  "fbdev" # The fbdev (Framebuffer Device) driver is a generic framebuffer driver that provides access to the frame buffer of the display hardware.
      # "modesetting"     # The modesetting driver is a generic driver for modern video hardware that relies on kernel modesetting (KMS) to set the display modes and manage resolution and refresh rate.
      # "amdgpu"          # This is the open-source kernel driver for AMD graphics cards. It's part of the AMDGPU driver stack and provides support for newer AMD GPUs.
      # "nouveau"         # Nouveau is an open-source driver for NVIDIA graphics cards. It aims to provide support for NVIDIA GPUs and is an alternative to the proprietary NVIDIA driver
      # "radeon"          # The Radeon driver is an open-source driver for AMD Radeon graphics cards. It provides support for older AMD GPUs.
    # ];
  };

  #---------------------------------------------------------------------
  # System Packages Configuration
  #---------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
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
    libportal-qt5
    plasma-browser-integration
    gparted
    kate
    kup
    vim 
    wget
    home-manager
    android-tools
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