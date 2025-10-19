{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "25.05";
  networking.hostName = "pc-gambled";
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    #./symlinks.nix

    #../../core/programs/corectrl.nix
    #../../core/programs/alvr.nix
    #../../core/services/wivrn.nix
    #../../core/services/docker.nix
    #../../core/services/suwayomi.nix
    #../../core/services/xrdp.nix
    ../../core/services/wakeonlan.nix
    ../../core/services/openrgb.nix
    ../../core/services/sunshine.nix
    ../../core/services/coolercontrol.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];
  environment.systemPackages = with pkgs; [
    lact
    (import ../../scripts/reboot-to-windows.nix { inherit pkgs; })
    (import ../../scripts/display-device.nix { inherit pkgs; })
    (callPackage ../../nixpkgs/pkgs/moondeckbuddy/package.nix {})
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

  powerManagement = {
    enable = true;
    powerUpCommands = 
      "openrgb -p HOLA.orp\n
      bluetoothctl connect 24:95:2F:60:BD:94";
    resumeCommands = 
      "openrgb -p HOLA.orp\n
      bluetoothctl connect 24:95:2F:60:BD:94";
  };


  # virtualisation
  # virtualisation.vmware.host.enable = true; # vmware
  # virtualisation.waydroid.enable = true; # Waydroid
  # for gpu overclock
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
