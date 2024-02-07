{ config, lib, pkgs, ... }:

with lib;

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings= {
      PasswordAuthentication = true;
      AllowUsers = [ "gambled" ];
      X11Forwarding = true;
    };
  };
}
