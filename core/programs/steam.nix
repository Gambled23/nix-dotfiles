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

  programs.gamemode.enable = true;

  jovian = {
    # steam = {
    #   enable = true;
    #   desktopSession = "plasma-wayland";
    # };
    # decky-loader = {
    #   enable = true;
    # };
    hardware.has.amd.gpu = true;
  };
}
