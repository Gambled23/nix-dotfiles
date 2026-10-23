{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    control_center = {
      circular_avatar = true;
      hidden_tabs = [  ];
      show_session_button = true;
      show_shortcut_labels = true;
      sidebar = "compact";
      sidebar_section = "compact";
      width = 800;
      calendar = {
        show_events_card = true;
        show_week_numbers = false;
      };
      media = {
        show_visualizer = true;
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
