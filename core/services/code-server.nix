{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.openvscode-server = {
    enable = true;
    withoutConnectionToken = true;
  };
}