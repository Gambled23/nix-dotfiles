{ config, pkgs, lib, ... }:
let
  elias = "joto";
in
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    # package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  #programs.gamemode.enable = true;

  #jovian = {
  #  steam = {
  #    enable = true;
  #    # autoStart = true;
  #    desktopSession = "gamescope-wayland";
  #    user = "gambled";
  #  };
  #  decky-loader = {
  #    enable = true;
  #    user = "gambled";
  #  };
  #  hardware.has.amd.gpu = true;
  #};
}
