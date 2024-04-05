{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  imports = [
    ../../home.nix
  ];
  
  home.packages = with pkgs; [ 
    # books
    #hakuneko
    #kcc
    #calibre
    #mangal

    # dev tools
    android-studio
    #cmake
    
    #dev languages

    # games
    gamemode
    ryujinx
    steam
    steam-run
    osu-lazer-bin
    prismlauncher #minecra
    r2modman
    wineWowPackages.waylandFull
    #vr
    monado
    opencomposite
    
    # media
    scrcpy
    # media creation
    inkscape-with-extensions
    qt6.qtwebsockets
    libsForQt5.kdenlive
    libportal-qt5
    obs-studio
    kdenlive
    jellyfin-ffmpeg

    # messaging 
    whatsapp-for-linux
    telegram-desktop

    # utils
    polychromatic
    autorandr # for multi monitor setups
    nextcloud-client

    #web browsers
    #chromium
  ];
}


