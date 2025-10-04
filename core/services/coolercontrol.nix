{ config, lib, pkgs, ... }:

with lib;

{
  programs.coolercontrol = {
    enable = true;
  };
}
