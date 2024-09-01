{ config, pkgs, lib, ... }:

{
  virtualisation.docker.enable = true;
  users.users.gambled.extraGroups = [ "docker" ];
}
