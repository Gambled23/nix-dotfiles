{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "pc-gambled";
  imports =
    [ 
      ../../configuration.nix
      ./hardware-configuration.nix
      ../../core/services/wakeonlan.nix
    ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
    gamescopeSession.enable = true;
  };

  # open razer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["gambled"];

  # Waydroid
  # virtualisation.waydroid.enable = true;

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

  # vmware
  virtualisation.vmware.host.enable = true;
  # xrdp server
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startplasma-x11";
  services.xrdp.openFirewall = true;
  
}
