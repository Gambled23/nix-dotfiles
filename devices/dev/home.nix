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
    # ../../core/programs/firefox.nix
  ];

  home.packages = with pkgs; [
    #* dev tools
    dbeaver-bin
    vscode
    # android-studio
    # jdk25_headless
    bruno

    #* media
    vlc

    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus
    
    #* utils
    android-tools
    libreoffice
    scrcpy
    miraclecast
    gnome-network-displays
    moonlight-qt
    stremio-linux-shell
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    siyuan

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    # "com.stremio.Stremio"
    "com.artemchep.keyguard"
  ];
}
