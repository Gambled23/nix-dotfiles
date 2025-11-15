{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.code-server = {
    enable = true;
    host = "0.0.0.0";
    
  };
  networking.firewall.allowedTCPPorts = [
    config.services.code-server.port
    4444
  ];
}