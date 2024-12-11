{ config, pkgs, lib, ... }:

{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
    settings.port = 47989;
  };
}
