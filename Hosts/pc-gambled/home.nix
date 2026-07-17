{
  inputs,
  lib,
  config,
  pkgs,
  nur,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    inputs.sls-steam.homeModules.sls-steam
    ../../Machines/Core/home.nix
    ../../Machines/Desktop/home.nix

    ../../Features/Gaming/slsteam.nix
  ];

  home.packages =
    with pkgs; [
    #* books
    # hakuneko
    # kcc
    # calibre
    # komikku
    # grayjay
    pkgs.nur.repos.Ev357.hayase

    #* dev tools
    # android-studio
    # jdk25_headless

    #* games
    inputs.accela.packages.${pkgs.stdenv.hostPlatform.system}.default
    ludusavi
    # vintagestory
    # itch
    gamemode
    winetricks
    steam-rom-manager
    # osu-lazer-bin
    # tetrio-desktop
    # prismlauncher
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

    #* media creation
    obs-studio
  ];

  home.file.".zshrc".text = "export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";
}
