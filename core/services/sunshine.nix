{ config, pkgs, lib, ... }:

{
  services.sunshine = {
    enable = true;
    openFirewall = true;
  };
}
