{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home.nix
  ];
  
  home.packages = with pkgs; [ 
    # dev
    python3
    python311Packages.pip

    # games
    steam
    steam-run
    osu-lazer-bin

    # media
    stremio

    # media creation
    inkscape-with-extensions
    gimp-with-plugins

    # messaging 
    whatsapp-for-linux
    telegram-desktop

    # utils
    
  ];
}


