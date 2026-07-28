{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    control_center = {
      hidden_tabs = [  ];
      show_shortcut_labels = true;
      sidebar = "compact";
      sidebar_section = "compact";
      width = 800;
      calendar = {
        event_date_format = "%A %e %B";
        event_time_format = "%H:%M";
        show_events_card = true;
        show_week_numbers = false;
      };
      shortcuts = [ {
        type = "wifi";
      } {
        type = "bluetooth";
      } {
        type = "notification";
      } {
        type = "dark_mode";
      } {
        type = "caffeine";
      } {
        type = "power_profile";
      } ];
    };
  };
}
