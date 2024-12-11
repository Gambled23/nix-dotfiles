{ config, pkgs, lib, ... }:

{
  # xrdp server
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startplasma-wayland";
  services.xrdp.openFirewall = true;
}
