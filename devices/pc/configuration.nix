{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "pc-gambled";
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    #./symlinks.nix

    #../../core/programs/alvr.nix
    # ../../core/services/coolercontrol.nix
    #../../core/programs/corectrl.nix
    # ../../core/services/docker.nix
    ../../core/services/mariadb.nix
    ../../core/services/ollama-server.nix
    ../../core/services/openrgb.nix
    ../../core/programs/steam.nix
    ../../core/services/sunshine.nix
    #../../core/services/suwayomi.nix
    ../../core/services/wakeonlan.nix
    #../../core/services/wivrn.nix
    #../../core/services/xrdp.nix

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
    lact
    i2c-tools
    # openclaw
    (import ../../scripts/reboot-to-windows.nix { inherit pkgs; })
    (import ../../scripts/display-device.nix { inherit pkgs; })
    (import ../../scripts/modo-tele.nix { inherit pkgs; })
    (import ../../scripts/flash-kernelsu.nix { inherit pkgs; })
    # (import ../../scripts/songdetails.nix { inherit pkgs; })
    (callPackage ../../nixpkgs/pkgs/hayase/package.nix {})
    # (callPackage ../../nixpkgs/pkgs/stremio/package.nix {})
    (callPackage ../../nixpkgs/pkgs/accela/default.nix {})
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

  
  # virtualisation
  # virtualisation.vmware.host.enable = true; # vmware
  # virtualisation.waydroid.enable = true; # Waydroid
  # for gpu overclock
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

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

  # environment = {
  # sessionVariables = lib.mkForce {
  #     LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";
  #   };
  # };

  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    # dolphin-overlay.overlays.default
  ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "openclaw-2026.3.12"
  # ];

  
}
