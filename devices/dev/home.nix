{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    ../../home.nix
    ./hyprland/dev.nix
    
    ../../core/programs/ghostty.nix
    ../../core/programs/vscode.nix
  ];

  home.packages = with pkgs; [
    #* dev tools
    dbeaver-bin
    act3
    harlequin
    claude-code
    bruno
    # android-studio
    # jdk25_headless

    #* media
    vlc

    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus
    
    #* utils
    speedcrunch
    android-tools
    libreoffice
    scrcpy
    moonlight-qt
    siyuan
    # gnome-network-displays
    # stremio-linux-shell
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.stremio.Stremio"
    "com.artemchep.keyguard"
    "org.gnome.NetworkDisplays"
  ];
}
