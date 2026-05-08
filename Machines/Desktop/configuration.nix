{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    # Desktop enviroment
    ../../Features/Ricing/WM/Hyprland/hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    (import ../../Scripts/flash-kernelsu.nix { inherit pkgs; })
  ];

  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://vicinae.cachix.org"
      ];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      ];
    };
  };

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
  # virtualisation.waydroid.enable = true; # Waydroid
}
