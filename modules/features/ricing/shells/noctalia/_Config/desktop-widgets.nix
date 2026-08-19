{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    desktop_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [ "desktop-widget-0000000000000001" "desktop-widget-0000000000000005" ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget = {
        desktop-widget-0000000000000001 = {
          box_height = 288.0;
          box_width = 656.0;
          cx = 368.0;
          cy = 218.0;
          enabled = true;
          output = "DP-3";
          placement_height = 1440.0;
          placement_width = 3440.0;
          rotation = 0.0;
          type = "media_player";
          settings = {
            layout = "horizontal";
          };
        };
        desktop-widget-0000000000000005 = {
          box_height = 256.0;
          box_width = 464.0;
          cx = 3080.0;
          cy = 1232.0;
          enabled = true;
          output = "DP-3";
          placement_height = 1440.0;
          placement_width = 3440.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            
          };
        };
      };
    };
  };
}
