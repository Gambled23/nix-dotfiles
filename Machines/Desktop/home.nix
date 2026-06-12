{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../Features/Tools/ghostty.nix
    ../../Features/Tools/Media/spicetify.nix
    ../../Features/Gaming/nixcord.nix
    # ../../Features/Ricing/WM/Niri/config.nix
    ../../Features/Ricing/WM/Hyprland/config.nix
  ];

  home.packages = with pkgs; [
    #* dev tools
    github-cli
    vscode
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
    inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
    
    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus
    #* Media
    # stremio-linux-shell

    #* utils
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
    "com.stremio.Stremio"
  ];
}
