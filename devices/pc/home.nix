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
    komikku

    # dev tools
    android-studio
    #cmake

    # games
    #gamemode
    winetricks
    #heroic
    ryujinx
    osu-lazer-bin
    #tetrio-desktop
    #prismlauncher #minecra
    r2modman

    # utils
    polychromatic

    # algoritmos
    weka
    python312Packages.orange3
  ];
}


