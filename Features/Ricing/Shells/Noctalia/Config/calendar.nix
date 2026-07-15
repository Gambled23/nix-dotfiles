{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    calendar = {
      enabled = true;
      refresh_minutes = 15;
      account = {
        personal_google = {
          calendars = [  ];
          color = "";
          name = "ipog71";
          provider = "";
          server_url = "";
          type = "google";
          username = "";
        };
      };
    };
  };
}
