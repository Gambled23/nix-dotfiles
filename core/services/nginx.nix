{ config, pkgs, lib, ... }:
# Recipe manager for home cooking
{
  secutiry.acme = {
    acceptTerms = true;
    defaults.email = "ipog71@gmail.com";
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    virtualHosts."example.com" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/example.com";
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
