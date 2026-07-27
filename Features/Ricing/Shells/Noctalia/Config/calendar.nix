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
          credential_source = "secret-service";
          name = "ipog71";
          password_file = "";
          provider = "";
          server_url = "";
          type = "google";
          username = "";
        };
      };
    };
  };
}
