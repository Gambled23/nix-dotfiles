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

    ../../Features/Tools/Web/firefox.nix
  ];

  home.packages =
    with pkgs; [
    #* books
    #hakuneko
    #kcc
    #calibre
    komikku

    #* dev tools
    vscode
    # android-studio
    # jdk25_headless

    #* games
    inputs.accela.packages.${pkgs.stdenv.hostPlatform.system}.default
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
    tonelib-gfx
    tonelib-jam

    #* utils
    polychromatic
    via
    headsetcontrol

    #* media
    vlc

    #* media creation
    obs-studio

    #* messaging
    materialgram
  ];

  home.file.".zshrc".text = "export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";

  services.flatpak.packages = [
    "com.stremio.Stremio"
  ];
}
