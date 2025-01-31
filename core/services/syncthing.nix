{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "gambled";
    openDefaultPorts = true;
    dataDir = "/home/gambled";  # default location for new folders
    configDir = "/home/gambled/.config/syncthing";
  };
}
