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

    # games
    bottles
    ryujinx
    steam
    steam-run
    osu-lazer-bin
    #prismlauncher #minecra
    r2modman
    wineWowPackages.waylandFull

    # media

    # media creation
    inkscape-with-extensions
    qt6.qtwebsockets
    libsForQt5.kdenlive
    libportal-qt5
    obs-studio
    kdenlive
    jellyfin-ffmpeg

    # messaging 

    # utils
    polychromatic
    autorandr # for multi monitor setups
    remmina
  ];
}


