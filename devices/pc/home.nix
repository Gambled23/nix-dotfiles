{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ../../home.nix
  ];
  
  home.packages = with pkgs; [ 
    # books
    #hakuneko
    #kcc
    #calibre
    #mangal

    # dev
    android-studio
    python3
    python311Packages.pip
    php83Packages.composer
    php83
    nodejs_21

    # games
    bottles
    steam
    steam-run
    osu-lazer-bin
    prismlauncher
    r2modman
    wineWowPackages.waylandFull

    # media
    stremio
    kodi-wayland

    # media creation
    inkscape-with-extensions
    gimp-with-plugins
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
  ];
}


