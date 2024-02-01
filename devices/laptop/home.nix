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

    # games
    steam
    steam-run
    osu-lazer-bin

    # media
    stremio

    # media creation
    inkscape-with-extensions

    # messaging 

    # utils
    
  ];
}


