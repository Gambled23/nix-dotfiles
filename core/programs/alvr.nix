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
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };
  /*
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };
  */
}
