{ config, pkgs, lib, ... }:

{
  services.wivrn = {
    enable = true;
    openFirewall = true;
    };
}
