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

  home.packages = 
    let
      stremioPkgs = import inputs.nixpkgs-for-stremio {
        inherit (pkgs) system;
      };
    in
    with pkgs; [

    (stremioPkgs.stremio)

    #* books
    #hakuneko
    #kcc
    #calibre
    komikku
    
    #* dev tools
    #android-studio
    dbeaver-bin
    vscode

    #* games
    gamemode
    wineWowPackages.stable
    winetricks
    ryubing
    osu-lazer-bin
    #tetrio-desktop
    prismlauncher #minecra
    r2modman
    # mangohud

    #* utils
    polychromatic
    pdfarranger
    via
    winboat

    #* media
    vlc

    #* media creation
    gimp-with-plugins
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

    #* utils
    # activitywatch
    android-tools
    libreoffice
    scrcpy
    # zoom-us

    #* webbrowsers
    google-chrome
  ];
}
