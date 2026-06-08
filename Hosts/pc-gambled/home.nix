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
    inputs.sls-steam.homeModules.sls-steam

    ./hyprland.nix
    ../../Machines/Core/home.nix
    ../../Machines/Desktop/home.nix

    ../../Features/Gaming/slsteam.nix
  ];

  home.packages =
    with pkgs; [
    #* books
    #hakuneko
    #kcc
    #calibre
    komikku
    grayjay

    #* dev tools
    vscode
    # android-studio
    # jdk25_headless

    #* games
    eden
    inputs.accela.packages.${pkgs.stdenv.hostPlatform.system}.default
    # vintagestory
    # itch
    gamemode
    winetricks
    # osu-lazer-bin
    # tetrio-desktop
    # prismlauncher #minecra
    # r2modman
    # mangohud

    #* guitarra
    # carla
    guitarix
    fretboard

    #* utils
    pywalfox-native
    polychromatic
    via
    headsetcontrol

    #* media
    qbittorrent
    vlc

    #* media creation
    obs-studio

    #* messaging
    materialgram
  ];

  home.file.".zshrc".text = "export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";
}
