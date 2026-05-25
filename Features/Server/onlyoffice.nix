{ config, pkgs, lib, ... }:
{#
  services.onlyoffice = {
    enable = true;
    hostname = "0.0.0.0";
    port = 8005;
    allowLocalConnections = true;
    wopi = true;
    securityNonceFile = "${pkgs.writeText "nixos-test-onlyoffice-nonce.conf" ''
      set $secure_link_secret "nixostest";
    ''}";
  };
}
