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
    # ../../core/programs/firefox.nix
    ../../core/services/xserver/hyprland/config.nix

  ];

  home.packages = with pkgs; [
    #* books
    #hakuneko
    #kcc
    #calibre
    #mangal
    komikku
    coolercontrol.coolercontrold
    
    #* dev tools
    #android-studio
    #cmake
    arduino
    dbeaver-bin
    vscode

    #* games
    gamemode
    wineWowPackages.stable
    winetricks
    #heroic
    ryubing
    osu-lazer-bin
    #tetrio-desktop
    prismlauncher #minecra
    r2modman
    sm64coopdx
    # mangohud

    #* utils
    polychromatic
    #vulkan-tools
    pdfarranger
    via

    #* media
    vlc

    #* media creation
    gimp
    inkscape-with-extensions
    obs-studio

    #* messaging
    altus
    materialgram

    #* networking
    zerotierone

    #* guitarra
    guitarix
    tonelib-metal
    carla
    # gxplugins-lv2

    #* utils
    # activitywatch
    # p3x-onenote
    # protontricks
    # galaxy-buds-client
    # jellyfin-ffmpeg
    android-tools
    libreoffice
    # rquickshare
    scrcpy
    nextcloud-client
    zoom-us
    # koreader
    #logseq

    #* webbrowsers
    google-chrome
    #floorp
    #chromium
  ];
}
