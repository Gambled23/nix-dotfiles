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
    package = pkgs.steam-millennium;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
};

  programs.gamemode.enable = true;

  # jovian = {
  #   steam = {
  #     enable = true;
  #     # autoStart = true;
  #     desktopSession = "plasma";
  #     user = "gambled";
  #   };
  #   decky-loader = {
  #     enable = true;
  #     user = "gambled";
  #   };
  #   hardware.has.amd.gpu = true;
  # };
  
  system.userActivationScripts.linktosharedfolder.text = ''
    if [[ ! -h "$HOME/.homebrew" ]]; then
      ln -s "/var/lib/decky-loader/" "$HOME/.homebrew"
    fi
  '';
}
