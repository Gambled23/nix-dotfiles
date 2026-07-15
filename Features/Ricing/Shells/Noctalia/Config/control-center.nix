{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    control_center = {
      hidden_tabs = [  ];
      sidebar = "compact";
      sidebar_section = "compact";
      width = 800;
      calendar = {
        show_events_card = true;
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
        type = "audio";
      } ];
    };
  };
}
