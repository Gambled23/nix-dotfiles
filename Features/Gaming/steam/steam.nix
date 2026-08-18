{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    # ./jovian/jovian-nixos.nix
    # ./sls-steam/sls-steam.nix
    ./nix-crab/nix-crab.nix
  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    protonup-ng
    # gamescope-wsi
  ];
}
