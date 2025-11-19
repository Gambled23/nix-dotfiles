{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [ (final: prev: {
  moondeck-buddy = prev.callPackage ../../nixpkgs/pkgs/moondeckbuddy/package.nix { };
}) ];
  # A webservice to remote desktop based on moonlight
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    applications = {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "deck";
          cmd = "display-device -d steamdeck";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
        {
          name = "MoonDeckStream";
          cmd = "${pkgs.moondeck-buddy}/bin/MoonDeckStream";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
      ];
    };
  };
}
