{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "pc-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Core/configuration.nix
    ../../Machines/Desktop/configuration.nix

    ../../Features/Dev/ollama-server.nix
    ../../Features/Gaming/glances.nix
    ../../Features/Gaming/steam.nix
    ../../Features/Gaming/sunshine.nix
    ../../Features/Network/wakeonlan.nix

    # bootloader
    ../../Features/Boot/grub.nix
  ];

  environment.systemPackages = with pkgs; [
    lact # gpu overclocking
    i2c-tools #for monitoring sensors
    ryubing
    dolphin-emu
    dotnet-runtime_9

    (import ../../Scripts/reboot-to-windows.nix { inherit pkgs; })
    (import ../../Scripts/display-device.nix { inherit pkgs; })
    (import ../../Scripts/modo-tele.nix { inherit pkgs; })

    # (callPackage ../../Pkgs/hayase/package.nix {})
  ];

  # for gpu overclock
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  # environment = {
  # sessionVariables = lib.mkForce {
  #     LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";
  #   };
  # };
}
