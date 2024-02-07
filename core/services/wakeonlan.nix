{ config, pkgs, lib, ... }:

{
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
}
