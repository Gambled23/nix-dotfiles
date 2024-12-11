{ config, pkgs, lib, ... }:

{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
    settings.port = 47990;
  };
  networking.firewall.allowedTCPPortRanges = [{ from = 47984; to = 48010; }];
  networking.firewall.allowedUDPPortRanges = [{ from = 47988; to = 48010; }];
}
