{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    dock = {
      active_monitor_only = false;
      active_opacity = 1.0;
      active_scale = 1.0;
      auto_hide = true;
      background_opacity = 0.30000001192092896;
      border = "tertiary";
      border_width = 1.0;
      concave_edge_corners = false;
      cross_axis_padding = 8;
      enabled = true;
      icon_size = 48;
      inactive_opacity = 0.8500000238418579;
      inactive_scale = 0.8500000238418579;
      item_spacing = 6;
      launcher_custom_image = "";
      launcher_custom_image_colorize = false;
      launcher_icon = "grid-dots";
      launcher_position = "none";
      magnification = true;
      magnification_scale = 1.25;
      main_axis_padding = 16;
      margin_edge = 8;
      margin_ends = 0;
      monitors = [  ];
      pinned = [  ];
      position = "bottom";
      radius = 16;
      radius_bottom_left = 16;
      radius_bottom_right = 16;
      radius_top_left = 16;
      radius_top_right = 16;
      reserve_space = false;
      shadow = false;
      show_dots = false;
      show_instance_count = true;
      show_running = true;
      smart_auto_hide = false;
    };
  };
}
