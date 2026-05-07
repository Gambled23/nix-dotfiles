{ config, pkgs, lib, ... }:

{
  services.glances = {
    enable = true;
    openFirewall = true;
  };
}
