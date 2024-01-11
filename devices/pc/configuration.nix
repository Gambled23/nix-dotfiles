{ config, pkgs, lib, inputs, outputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  #Wake on lan
  networking.interfaces.enp6s0.wakeOnLan.enable = true;
  systemd.services.wakeonlan = {
    description = "Reenable wake on lan every boot";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "true";
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp6s0 wol g";
    };
    wantedBy = [ "default.target" ];
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };
}
