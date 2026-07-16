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
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
    
    #* media 
    gimp-with-plugins
    (callPackage ../../Pkgs/nuvio/package.nix {})
    # inkscape-with-extensions

    #* messaging
    vlc
    altus
    materialgram
    #* Media
    # stremio-linux-shell

    #* utils
    seahorse #gnome keyring manager
    # pixelflasher
    android-tools
    onlyoffice-desktopeditors
    scrcpy
    siyuan
    qalculate-gtk
    gnome-control-center
    # zoom-us

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.artemchep.keyguard"
    # "com.stremio.Stremio"
    "app.zen_browser.zen"
  ];
}
