{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "pc-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Core/configuration.nix
    ../../Machines/Desktop/configuration.nix

    ../../Features/Gaming/glances.nix

    ../../core/services/ollama-server.nix
    ../../core/services/openrgb.nix
    ../../core/programs/steam.nix
    ../../core/services/sunshine.nix
    ../../core/services/wakeonlan.nix


    # bootloader
    ../../core/bootloader/grub.nix

    # Desktop enviroment
    ../../core/services/xserver/hyprland/hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    lact # gpu overclocking
    i2c-tools #for monitoring sensors
    ryubing

    (import ../../scripts/reboot-to-windows.nix { inherit pkgs; })
    (import ../../scripts/display-device.nix { inherit pkgs; })
    (import ../../scripts/modo-tele.nix { inherit pkgs; })

    (callPackage ../../nixpkgs/pkgs/hayase/package.nix {})
    # (callPackage ../../nixpkgs/pkgs/stremio/package.nix {})
    # (callPackage ../../nixpkgs/pkgs/accela/default.nix {})
  ];

  # Nix settings
  # nix.settings = {
  #   max-jobs = 2;
  #   cores = 6;
  # };

  # virtualisation
  # virtualisation.vmware.host.enable = true; # vmware
  # virtualisation.waydroid.enable = true; # Waydroid
  # for gpu overclock
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

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
