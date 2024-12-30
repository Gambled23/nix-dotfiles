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
              do = "${pkgs.killall}/bin/killall -q steam";
              undo = "${pkgs.killall}/bin/killall -q steam";
            }
            {
              do = "steam -start steam://open/bigpicture";
              undo = "steam";
            }
          ];
          image-path = "steam.png";
        }
      ];
    };
    settings = {
      output_name = "2";
    };
  };
}
