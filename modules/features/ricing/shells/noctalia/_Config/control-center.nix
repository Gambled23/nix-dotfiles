{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    control_center = {
      hidden_tabs = [  ];
      show_session_button = true;
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
        type = "icefish/phone-connect:tile";
      } {
        type = "yocraft/custom-shortcut:shortcut";
      } {
        type = "wifi";
      } {
        type = "bluetooth";
      } {
        type = "dark_mode";
      } {
        type = "alexander/screen-toolkit:toggle";
      } ];
    };
  };
}
