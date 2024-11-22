{ config, pkgs, lib, ... }:

{
  # xrdp server
  #services.xrdp.enable = true;
  #services.xrdp.defaultWindowManager = "startplasma-x11";
  services.xrdp.openFirewall = true;
}
