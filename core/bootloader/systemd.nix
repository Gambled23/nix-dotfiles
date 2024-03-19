{ config, pkgs, lib, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = { 
      systemd-boot.enable = true;
    };
  };
}
