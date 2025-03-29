{ config, pkgs, lib, ... }:

{
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
        {
          name = "Steam Big Picture";
          prep-cmd = [
            {
              do = "modo-tele enable";
              undo = "modo-tele disable";
            }
          ];
          image-path = "steam.png";
          output = "/home/gambled/logSteam.txt";
        }
        {
          name = "MoonDeckStream";
          prep-cmd = [
            {
              do = "MoonDeckStream";
              undo = "modo-tele disable";
            }
          ];
          commands = "MoonDeckStream";
        }
      ];
    };
  };
}
