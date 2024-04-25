{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "pc-gambled";
  imports = [ 
    ../../configuration.nix
    ./hardware-configuration.nix

    ../../core/services/wakeonlan.nix
    ../../core/services/xrdp.nix
    ../../core/programs/alvr.nix
    ../../core/programs/steam.nix
  ];

  # amdgpu
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  # For 32 bit applications 
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
  boot.kernelParams = [
    "video=DP-1:1920x1080@165"
    "video=HDMI-A-2:1920x1080@64"
  ];

  # open razer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["gambled"];

  # virtualisation
  virtualisation.vmware.host.enable = true; # vmware
  # virtualisation.waydroid.enable = true; # Waydroid

  # disctrack
  systemd.services.powerprofile = {
  wantedBy = [ "multi-user.target" ];
  path = [ pkgs.coreutils ];
  enable = true;
  serviceConfig = {
    User = "root";
    Group = "root";
    };
  script = ''
  cd /hdd/home/gambled/Documents/trakt/
  /hdd/home/gambled/Documents/trakt/discrakt'';
  };

}
