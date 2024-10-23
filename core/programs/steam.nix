{ config, pkgs, lib, ... }:
let
  # plugin_loader = pkgs.buildFHSUserEnv {
  #   name = "PluginLoader";
  #   targetPkgs = p: with p; [
  #     zlib
  #     coreutils

  #     /* needed for css loader */
  #     curl
  #     unzip

  #     /* needed for volume mixer */
  #     pulseaudio
  #   ];
  #   runScript = "/home/user/homebrew/services/PluginLoader";
  # };
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

  # Decky
  # systemd.services.plugin_loader = {
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "network-online.target" ];
  #   wants = [ "network-online.target" ];
  #   environment = {
  #     PLUGIN_PATH = "/home/user/homebrew/plugins";
  #     LOG_LEVEL = "INFO";
  #   };
  #   serviceConfig = {
  #     Type = "simple";
  #     User = "root";
  #     Restart = "always";
  #     ExecStart = "${plugin_loader}/bin/PluginLoader";
  #     WorkingDirectory = "/home/user/homebrew/services";
  #     KillSignal = "SIGKILL";
  #   };
  # };
  
}
