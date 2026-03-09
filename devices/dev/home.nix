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
    android-studio
    jdk25_headless
    remmina

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
    gnome-network-displays
    moonlight-qt
    bitwarden-desktop
    stremio-linux-shell
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.stremio.Stremio"
    "com.artemchep.keyguard"
  ];
}
