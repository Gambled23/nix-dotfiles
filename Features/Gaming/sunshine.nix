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
      # output_name = 0;
    };
    applications = {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "steamdeck";
          cmd = "";
          exclude-global-prep-cmd = "false";
          elevated = "false";
          prep-cmd = [
            {
              do = "display-device -d steamdeck";
              # undo = "display-device -d pc-gambled";
              elevated = false;
            }
          ];
        }
        {
          name = "pc-gambled";
          cmd = "";
          exclude-global-prep-cmd = "false";
          elevated = "false";
          prep-cmd = [
            {
              do = "display-device -d pc-gambled";
              undo = "";
              elevated = false;
            }
          ];
        }
        {
          name = "dev-gambled";
          cmd = "";
          exclude-global-prep-cmd = "false";
          elevated = "false";
          prep-cmd = [
            {
              do = "display-device -d dev-gambled";
              undo = "";
              elevated = false;
            }
          ];
        }
        {
          name = "tv";
          cmd = "";
          exclude-global-prep-cmd = "false";
          elevated = "false";
          prep-cmd = [
            {
              do = "display-device -d tv";
              undo = "";
              elevated = false;
            }
          ];
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
