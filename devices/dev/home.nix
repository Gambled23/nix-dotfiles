{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
  imports = [
    ../../home.nix
    ./hyprland/dev.nix
    # ../../core/programs/firefox.nix

  ];

  home.packages = with pkgs; [
    #* dev tools
    dbeaver-bin
    vscode

    #* media
    vlc

    #* media creation
    gimp-with-plugins
    inkscape-with-extensions

    #* messaging
    altus
    
    #* utils
    android-tools
    libreoffice
    scrcpy
    gnome-network-displays
    moonlight-qt
    bitwarden-desktop
    pixelflasher
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    #* webbrowsers
    google-chrome
  ];
}
