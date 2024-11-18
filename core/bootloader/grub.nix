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
        xd
        efiInstallAsRemovable = true;
        timeoutStyle = "menu";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
}
