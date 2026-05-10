{ config, pkgs, lib, ... }:
# Service like ilovepdf, but self hosted and opensource
# nginx default to port 80
{
  services.bentopdf = {
    enable = true;
    domain = "_";
    # nginx = {
    #   enable = true;
    #   virtualHost.listen = [
    #     {
    #       addr = "0.0.0.0";
    #       port = 8090;
    #     }
    #   ];
    # };
  };
}
