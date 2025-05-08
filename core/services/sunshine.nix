{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [ (final: prev: {
  # moondeck-buddy = prev.callPackage ../../nixpkgs/pkgs/moondeckbuddy.nix { };
}) ];
  # A webservice to remote desktop based on moonlight
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    applications =
    {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "Desktop";
          image-path = "desktop.png";
          output = "/home/gambled/log.txt";
        }
        # {
        #   name = "MoonDeckStream";
        #   cmd = "${pkgs.moondeck-buddy}/bin/MoonDeckStream";
        #   exclude-global-prep-cmd = "false";
        #   elevated = "false";
        # }
        {
          name = "Steam Big Picture";
          image-path = "steam.png";
          detached = [ "steam steam://open/bigpicture" ];
          auto-detach = "true";
          wait-all = "true";
          exit-timeout = "5";
        }
      ];
    };
  };
}
