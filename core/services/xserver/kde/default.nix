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
      plasma6.enable = true;
    };

    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "gambled";
      extraConfig = ''
        # LightDM Mini Greeter Configuration
        #
        # To test your configuration out, run: lightdm --test-mode

        [greeter]
        # The user to login as.
        user = gambled
        # Whether to show the password input's label.
        show-password-label = true
        # The text of the password input's label.
        password-label-text = Password:
        # The text shown when an invalid password is entered. May be blank.
        invalid-password-text = Invalid Password
        # Show a blinking cursor in the password input.
        show-input-cursor = true
        # The text alignment for the password input. Possible values are:
        # "left" or "right"
        password-alignment = left


        [greeter-hotkeys]
        # The modifier key used to trigger hotkeys. Possible values are:
        # "alt", "control" or "meta"
        # meta is also known as the "Windows"/"Super" key
        mod-key = meta
        # Power management shortcuts (single-key, case-sensitive)
        shutdown-key = s
        restart-key = r
        hibernate-key = h
        suspend-key = u


        [greeter-theme]
        # A color from X11's `rgb.txt` file, a quoted hex string(`"#rrggbb"`) or a
        # RGB color(`rgb(r,g,b)`) are all acceptable formats.

        # The font to use for all text
        font = "Cantarell Light"
        # The font size to use for all text
        font-size = 12px
        # The default text color
        text-color = "#e1eef2"
        # The color of the error text
        error-color = "#fc5571"
        # An absolute path to an optional background image.
        # The image will be displayed centered & unscaled.
        background-image = "/etc/lightdm/wallpaper.png"
        # The screen's background color.
        background-color = "#727282"
        # The password window's background color
        window-color = "#37353a"
        # The color of the password window's border
        border-color = "#967b5e"
        # The width of the password window's border.
        # A trailing `px` is required.
        border-width = 2px
        # The pixels of empty space around the password input.
        # Do not include a trailing `px`.
        layout-space = 15
        # The color of the text in the password input.
        password-color = "#e1eef2"
        # The background color of the password input.
        password-background-color = "#37353a"
        # The color of the password input's border.
        password-border-color = "#000000"
        # The width of the password input's border.
        password-border-width = 0
      '';
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
    libsForQt5.signond
    libsForQt5.qoauth
    libsForQt5.kio-gdrive
    libsForQt5.ktorrent
    libsForQt5.libktorrent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.bismuth
    libportal-qt5
    qt6.qtwebengine
    kate
    kup
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