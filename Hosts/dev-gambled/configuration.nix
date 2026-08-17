{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "dev-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
   ../../Machines/Desktop/configuration.nix

    # ../../Features/Dev/ollama-client.nix
    ../../Features/Dev/docker.nix
    # ../../Features/Tools/waydroid.nix
    # ../../Features/Dev/mariadb.nix

    # bootloader
    ../../Features/Boot/grub.nix
  ];

  nix.settings = {
    max-jobs = 3;
    cores = 4;
  };

  # services.cng-plus-ml = {
  #   enable = true;
  #   workingDir = "/home/gambled/Codes/cng-plus-ml";
  # };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  programs.moonlight-qt = {
    enable = true;
    capSysNice = true;
    package = (pkgs.moonlight-qt.override {
      ffmpeg_8 = pkgs.ffmpeg_6;
    });
  };
}
