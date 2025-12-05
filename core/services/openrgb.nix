{ config, lib, pkgs, ... }:

with lib;

{
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    startupProfile = "off.orp";
  };
}
