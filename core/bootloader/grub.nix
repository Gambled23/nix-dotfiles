{ config, pkgs, lib, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = { 
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        default = "saved";
       timeoutStyle = "menu";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
}
