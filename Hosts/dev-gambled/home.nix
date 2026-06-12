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
    ../../Machines/Core/home.nix
    ../../Machines/Desktop/home.nix
  ];

  home.packages = with pkgs; [
    #* dev tools
    dbeaver-bin
    bruno
    awscli
    remmina
    # android-studio
    # jdk25_headless

    #* utils
    moonlight-qt
    vlc
  ];
}
