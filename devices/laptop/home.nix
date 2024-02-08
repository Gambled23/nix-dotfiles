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


