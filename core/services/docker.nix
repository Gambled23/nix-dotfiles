{ config, pkgs, lib, ... }:

{
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  users.users.gambled.extraGroups = [ "docker" ];
}
