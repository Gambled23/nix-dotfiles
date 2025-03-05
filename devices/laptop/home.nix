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
    # games
    xorg.libxcb
    moonlight-qt
  ];
}
