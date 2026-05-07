{ config, pkgs, lib, ... }:

{
#   nixpkgs.overlays = [ (final: prev: {
#   moondeck-buddy = prev.callPackage ../../nixpkgs/pkgs/moondeckbuddy/package.nix { };
# }) ];
  # A webservice to remote desktop based on moonlight
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      sunshine_name = "el sunchine";
      output_name = 1;
    };
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
          name = "phone";
          cmd = "display-device -d android-gambled";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
        {
          name = "dev-gambled";
          cmd = "display-device -d dev-gambled";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
        {
          name = "1080p";
          cmd = "display-device -d 1080p";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
      ];
    };
  };
}
