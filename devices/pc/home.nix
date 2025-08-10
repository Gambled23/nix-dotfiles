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
  ];

  home.packages = with pkgs; [
    # books
    #hakuneko
    #kcc
    #calibre
    #mangal
    komikku

    # dev tools
    #android-studio
    #cmake

    # games
    gamemode
    wineWowPackages.stable
    winetricks
    #heroic
    ryubing
    osu-lazer-bin
    #tetrio-desktop
    prismlauncher #minecra
    r2modman
    millennium
    # mangohud

    # utils
    polychromatic
    #vulkan-tools
    pdfarranger
    via


  ];
}
