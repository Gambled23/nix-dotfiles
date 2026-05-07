{ config, pkgs, lib, ... }:
# Service like ilovepdf, but self hosted and opensource
# nginx default to port 80
{
  services.bentopdf = {
    enable = true;
    domain = "0.0.0.0";
    nginx = {
      enable = true;
    };
  };
}
