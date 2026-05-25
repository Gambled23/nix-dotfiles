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
    github-cli
    act3
    zed-editor-fhs
    vscode
    
    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus
    #* Media
    # stremio-linux-shell

    #* utils
    android-tools
    libreoffice
    onlyoffice-desktopeditors
    scrcpy
    siyuan
    qalculate-gtk
    # zoom-us

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.artemchep.keyguard"
    "com.stremio.Stremio"
  ];
}
