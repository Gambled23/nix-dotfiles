{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "23.11";
  networking.hostName = "pc-gambled";
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    ./symlinks.nix

    ../../core/services/wakeonlan.nix
    ../../core/services/docker.nix
    #../../core/services/xrdp.nix
    #../../core/programs/alvr.nix
    ../../core/programs/steam.nix
    #../../core/services/suwayomi.nix
    ../../core/services/wivrn.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];

  # amdgpu
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.enable = true;
  #services.xserver.videoDrivers = [ "amdgpu" ];
  # hardware.graphics.extraPackages = with pkgs; [
  #   amdvlk
  # ];
  # # For 32 bit applications
  # hardware.graphics.extraPackages32 = with pkgs; [
  #   driversi686Linux.amdvlk
  # ];
  #hardware.amdgpu.amdvlk.enable = true;

  boot.kernelParams = [
    "video=DP-1:1920x1080@165"
    "video=HDMI-A-2:1920x1080@64"
    "quiet"
    "splash"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "boot.shell_on_fail"
  ];

  # open razer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["gambled"];

  # programs.droidcam.enable = true;

  # virtualisation
  # virtualisation.vmware.host.enable = true; # vmware
  virtualisation.waydroid.enable = true; # Waydroid
  # for gpu overclock
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
