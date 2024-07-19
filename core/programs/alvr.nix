{ config, lib, pkgs, ... }:

with lib;

{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };
  /*
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };
  */
}
