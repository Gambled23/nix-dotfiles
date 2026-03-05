{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    ../../home.nix
    ./hyprland/pc.nix
    # ../../core/programs/firefox.nix

  ];

  home.packages = 
    # let
    #   stremioPkgs = import inputs.nixpkgs-for-stremio {
    #     inherit (pkgs) system;
    #   };
    # in
    with pkgs; [
    #* books
    #hakuneko
    #kcc
    #calibre
    komikku
    
    #* dev tools
    #android-studio
    android-studio
    jdk25_headless
    dbeaver-bin
    vscode

    #* games
    gamemode
    # wineWowPackages.stable
    winetricks
    ryubing
    # osu-lazer-bin
    #tetrio-desktop
    prismlauncher #minecra
    # r2modman
    # mangohud

    #* utils
    polychromatic
    pdfarranger
    via
    ente-auth
    bitwarden-desktop
    keyguard

    #* media
    vlc

    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions
    obs-studio

    #* messaging
    altus
    materialgram

    #* guitarra
    carla
    guitarix
    tonelib-gfx
    tonelib-jam

    #* utils
    # activitywatch
    android-tools
    libreoffice
    scrcpy
    # zoom-us

    #* webbrowsers
    google-chrome

    inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.file.".zshrc".text = "export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/";

  services.flatpak.packages = [
    "com.stremio.Stremio"
    "com.artemchep.keyguard"
  ];
}
