{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    # Window Manager
    ../../Features/Ricing/WM/Hyprland/hyprland.nix
    # ../../Features/Ricing/WM/Niri/niri.nix
    ../../Features/Ricing/WM/Mangowm/mangowm.nix

    #Display Manager
    ../../Features/Ricing/DM/ly.nix
    # ../../Features/Ricing/DM/noctalia-greeter.nix
  ];

  environment.systemPackages = with pkgs; [
    (import ../../Scripts/flash-kernelsu.nix { inherit pkgs; })
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  
  services.libinput.enable = true; # Enable touchpad support
  services.flatpak.enable = true; # Enable flatpak
  services.printing.enable = true; # Enable CUPS to print documents.

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

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  nixpkgs.config.android_sdk.accept_license = true;

  # Miracast
  networking.firewall = {
    trustedInterfaces = [ "p2p-wl+" ];
    allowedTCPPorts = [ 7236 7250 ];
    allowedUDPPorts = [ 7236 5353 ];
  };

  # Virtualisation
  # virtualisation.vmware.host.enable = true; # vmware
}
