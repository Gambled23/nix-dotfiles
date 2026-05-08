{ config, lib, pkgs, ... }:

with lib;

{
  # Personal ssh server
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
