{ config, lib, pkgs, ... }:

with lib;

{
  programs.alvr.enable = true;
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };
}
