{ config, pkgs, lib, ... }:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "ipog71@gmail.com";
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    virtualHosts."_" = {
      locations = {
        "/" = {
          proxyPass = "http://127.0.0.1:8082/";
          proxyWebsockets = true;
          extraConfig = ''
            rewrite ^/(.*)$ /$1 break;
          '';
        };
        "/home/" = {
          proxyPass = "http://127.0.0.1:8123/";
          proxyWebsockets = true;
          extraConfig = ''
            rewrite ^/home/(.*)$ /$1 break;
          '';
        };
        "/syncthing/" = {
          proxyPass = "http://127.0.0.1:8384/";
          proxyWebsockets = true;
          extraConfig = ''
            rewrite ^/syncthing/(.*)$ /$1 break;
          '';
        };
        "/paperless/" = {
          proxyPass = "http://127.0.0.1:28981/";
          proxyWebsockets = true;
          extraConfig = ''
            rewrite ^/paperless/(.*)$ /$1 break;
          '';
        };
        "/code-server/" = {
          proxyPass = "http://127.0.0.1:4444/";
          proxyWebsockets = true;
          extraConfig = ''
            rewrite ^/code-server/(.*)$ /$1 break;
          '';
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
