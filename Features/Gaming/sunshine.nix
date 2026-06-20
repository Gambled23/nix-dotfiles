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
      output_name = 0;
    };
    applications = {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "steamdeck";
          cmd = "display-device -d steamdeck";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
        {
          name = "pc-gambled";
          cmd = "display-device -d pc-gambled";
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
          name = "tv";
          cmd = "display-device -d tv";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
        {
          name = "no-change";
          exclude-global-prep-cmd = "false";
          elevated = "false";
        }
      ];
    };
  };

  programs.monique.enable = true;
}
