{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # ../../Features/Tools/ghostty.nix
    ../../Features/Tools/kitty.nix
    ../../Features/Tools/Media/spicetify.nix
    ../../Features/Tools/Media/spotify-player.nix
    ../../Features/Tools/vicinae.nix
    ../../Features/Gaming/nixcord.nix
    # ../../Features/Ricing/WM/Niri/config.nix
    # ../../Features/Ricing/WM/Hyprland/config.nix
    ../../Features/Ricing/WM/Mangowm/config.nix
    ../../Features/Ricing/Shells/Noctalia/noctalia_v5.nix
  ];
  
  home.packages = with pkgs; [
    (import ../../Scripts/flash-kernelsu.nix { inherit pkgs; })

    #* Dev tools
    github-cli
    vscode
    dbeaver-bin
    antares
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
    
    #* Media 
    vlc
    gimp-with-plugins
    inputs.nuvio.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nuvio-desktop
    # (callPackage ../../Pkgs/nuvio/package.nix {})
    # stremio-linux-shell
    # inkscape-with-extensions

    #* Messaging
    altus
    beeper
    # materialgram

    # Theming
    bibata-cursors
    papirus-icon-theme

    # Tools
    android-tools
    gnome-calendar
    gnome-control-center
    gnome-contacts
    gparted
    libreoffice-fresh
    nautilus
    # obsidian
    # onlyoffice-desktopeditors
    # pixelflasher
    qalculate-gtk
    scrcpy
    seahorse #gnome keyring manager
    siyuan
    via
    wdisplays # wlr-randr gui
    # zoom-us

    #* webbrowsers
    google-chrome
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.flatpak.packages = [
    "com.artemchep.keyguard"
    # "com.stremio.Stremio"
    # "app.zen_browser.zen"
  ];
}
