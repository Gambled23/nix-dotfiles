{ config, lib, pkgs, ... }:

with lib;

{
  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
  };

}
