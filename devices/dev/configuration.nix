{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "25.05";
  networking.hostName = "dev-gambled";
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    #./symlinks.nix

    ../../core/services/docker.nix
    ../../core/services/mysql.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix

    # Desktop enviroment
    ../../core/services/xserver/hyprland/hyprland.nix
    # ../../core/services/xserver/kde/default.nix
    #../../core/services/xserver/gnome/default.nix
    #../../core/services/xserver/i3/default.nix
    #../../core/services/xserver/awesome/awesomewm.nix
  ];

  environment.systemPackages = with pkgs; [
    (import ../../scripts/flash-kernelsu.nix { inherit pkgs; })
    (import ../../scripts/songdetails.nix { inherit pkgs; })
    # (callPackage ../../nixpkgs/pkgs/future_cursors/package.nix {})
  ];

  # amdgpu
  # boot.initrd.kernelModules = [ "amdgpu"]; //this makes initrd 30mb bigger
  services.xserver.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.initrd.enable = true;
  services.xserver.videoDrivers = ["modesetting"];

  boot.kernelParams = [
    "quiet"
    "splash"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "boot.shell_on_fail"
  ];

  
  services.flatpak.enable = true; # Enable flatpak
  services.libinput.enable = true; # Enable touchpad support
  services.printing.enable = true; # Enable CUPS to print documents.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}