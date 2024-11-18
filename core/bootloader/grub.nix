{ config, pkgs, lib, ... }:

{
  boot = {
    plymouth.enable = true;
    supportedFilesystems = [ "ntfs" ];
    loader = { 
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        efiInstallAsRemovable = true;
        timeoutStyle = "menu";
      };
    };
  };
}
