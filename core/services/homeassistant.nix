{ config, pkgs, lib, ... }:

{
  services.home-assistant = {
    enable = true;
    openFirewall = true;
  };
}
