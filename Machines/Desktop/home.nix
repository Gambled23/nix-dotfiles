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
  ];

  home.packages = with pkgs; [
    #* dev tools
    zed-editor-fhs
    vscode
    
    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus

    #* utils
    android-tools
    libreoffice
    scrcpy
    siyuan
    speedcrunch
    # zoom-us

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.artemchep.keyguard"
  ];
}
