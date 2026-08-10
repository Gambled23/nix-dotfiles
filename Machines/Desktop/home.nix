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
    #* dev tools
    github-cli
    vscode
    dbeaver-bin
    antares
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
    
    #* media 
    vlc
    gimp-with-plugins
    inputs.nuvio.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nuvio-desktop
    # (callPackage ../../Pkgs/nuvio/package.nix {})
    # inkscape-with-extensions

    #* messaging
    altus
    beeper
    # materialgram
    #* Media
    # stremio-linux-shell

    #* utils
    wdisplays # wlr-randr gui
    seahorse #gnome keyring manager
    # pixelflasher
    android-tools
    libreoffice-fresh
    # onlyoffice-desktopeditors
    scrcpy
    siyuan
    # obsidian
    qalculate-gtk
    gnome-control-center
    via
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
