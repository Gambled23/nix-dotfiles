{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.code-server = {
    enable = true;
  };
}