{ config, lib, pkgs, ... }:

with lib;

{
  services.openrgb = {
    enable = true;
    motherboard = "amd";
  };
}
