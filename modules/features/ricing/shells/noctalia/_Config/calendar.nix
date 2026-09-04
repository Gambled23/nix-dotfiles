{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    calendar = {
      enabled = true;
      event_date_format = "%A %e %B";
      event_time_format = "%H:%M";
      refresh_minutes = 15;
      account = {
        personal_google = {
          calendars = [  ];
          color = "";
          credential_source = "secret-service";
          name = "ipog71";
          password_file = "";
          path = "";
          provider = "";
          server_url = "";
          type = "google";
          username = "";
        };
      };
    };
  };
}
