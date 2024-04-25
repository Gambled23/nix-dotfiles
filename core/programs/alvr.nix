{ config, lib, pkgs, ... }:

with lib;

{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
  /*
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };
  */
}
