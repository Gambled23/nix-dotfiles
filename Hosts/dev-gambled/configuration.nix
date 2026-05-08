{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "dev-gambled";
  imports = [
    ../../Machines/Core/configuration.nix
    ../../Machines/Desktop/configuration.nix
    ./hardware-configuration.nix
    ./symlinks.nix

    ../../Features/Dev/ollama-client.nix
    ../../Features/Dev/docker.nix
    ../../Features/Dev/mariadb.nix

    # bootloader
    ../../Features/Boot/grub.nix

    # Desktop enviroment
    ../../Features/Ricing/WM/Hyprland/hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    (import ../../Scripts/flash-kernelsu.nix { inherit pkgs; })
  ];

  # amdgpu
  # boot.initrd.kernelModules = [ "amdgpu"]; //this makes initrd 30mb bigger
  services.xserver.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [gamemode];
    extraPackages32 = with pkgs; [gamemode];
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
  nixpkgs.config.android_sdk.accept_license = true;

  nix.settings = {
    max-jobs = 3;
    cores = 4;
  };

  networking.firewall.trustedInterfaces = [ "p2p-wl+" ];

  networking.firewall.allowedTCPPorts = [ 7236 7250 ];
  networking.firewall.allowedUDPPorts = [ 7236 5353 ];

  programs.wayvnc.enable = true;

  environment.variables = {
    OLLAMA_HOST="pc-gambled:11434";
  };
}
