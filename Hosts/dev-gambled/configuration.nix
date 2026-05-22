{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "dev-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Core/configuration.nix
    ../../Machines/Desktop/configuration.nix

    ../../Features/Dev/ollama-client.nix
    ../../Features/Dev/docker.nix
    ../../Features/Dev/mariadb.nix

    # bootloader
    ../../Features/Boot/grub.nix
  ];

  nix.settings = {
    max-jobs = 3;
    cores = 4;
  };

  # # Update nix-rbd before I leave work for the day
  # systemd.timers."nix-rbd-before-bed" = {
  #   wantedBy = [ "timers.target" ];
  #   timerConfig = {
  #     OnCalendar = "Mon..Fri 17:45";
  #     Persistent = true; 
  #     Unit = "nix-rbd-before-bed.service";
  #   };
  # };

  # systemd.services."nix-rbd-before-bed" = {
  #   script = ''
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "gambled";
  #     ExecStart = "${pkgs.writeShellScriptBin}/bin/nix-rbd";
  #   };
  # };
}
