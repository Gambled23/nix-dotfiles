{ config, pkgs, lib, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = { 
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        default = "hidden";
        efiInstallAsRemovable = true;
        timeoutStyle = "menu";
      };
    };
  };
}
