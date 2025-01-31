{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };
}
