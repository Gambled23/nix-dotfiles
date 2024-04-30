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

  system.userActivationScripts.linktosharedfolder.text = ''
    # Documentos personales
    if [[ ! -h "$HOME/Documents/Documentos personales" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/Documentos personales" "$HOME/Documents/Documentos personales"
    fi

    # Modular
    if [[ ! -h "$HOME/Documents/Modular" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/Modular" "$HOME/Documents/Modular"
    fi

    # Wallpapers
    if [[ ! -h "$HOME/Pictures/Wallpapers" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/Wallpapers" "$HOME/Pictures/Wallpapers"
    fi

    # Codes
    if [[ ! -h "$HOME/Codes" ]]; then
      ln -s "/hdd/home/gambled/Codes/" "$HOME/Codes"
    fi

    # Documents
    if [[ ! -h "$HOME/Documents" ]]; then
      ln -s "/hdd/home/gambled/Documents/" "$HOME/Documents"
    fi

    # Downloads
    if [[ ! -h "$HOME/Downloads" ]]; then
      ln -s "/hdd/home/gambled/Downloads/" "$HOME/Downloads"
    fi

    # Music
    if [[ ! -h "$HOME/Music" ]]; then
      ln -s "/hdd/home/gambled/Music/" "$HOME/Music"
    fi

    # Nextcloud
    if [[ ! -h "$HOME/Nextcloud" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/" "$HOME/Nextcloud"
    fi

    # Pictures
    if [[ ! -h "$HOME/Pictures" ]]; then
      ln -s "/hdd/home/gambled/Pictures/" "$HOME/Pictures"
    fi

    # Videos
    if [[ ! -h "$HOME/Videos" ]]; then
      ln -s "/hdd/home/gambled/Videos/" "$HOME/Videos"
    fi
  '';
}
