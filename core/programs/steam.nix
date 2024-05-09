{ config, pkgs, lib, ... }:

{
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    # package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
}
