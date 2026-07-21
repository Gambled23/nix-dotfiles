{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    bar = {
      order = [ "widgets" ];
      widgets = {
        auto_hide = false;
        background_opacity = 0.29999998211860657;
        border = "outline";
        border_width = 0.0;
        capsule = false;
        capsule_fill = "surface_variant";
        capsule_opacity = 1.0;
        capsule_padding = 6.0;
        capsule_thickness = 0.7599999904632568;
        center = [ "group:g1" ];
        concave_edge_corners = true;
        contact_shadow = false;
        enabled = true;
        end = [ "tray" "group:g2" "volume" "control-center" ];
        font_weight = 500;
        hover_highlight = true;
        layer = "top";
        margin_edge = 4;
        margin_ends = 4;
        margin_opposite_edge = 0;
        padding = 14;
        panel_overlap = 1;
        position = "top";
        radius = 12;
        radius_bottom_left = 12;
        radius_bottom_right = 12;
        radius_top_left = 12;
        radius_top_right = 12;
        reserve_space = true;
        scale = 1.149999976158142;
        shadow = false;
        show_on_workspace_switch = true;
        smart_auto_hide = false;
        start = [ "vicinae" "workspaces" ];
        thickness = 34;
        widget_spacing = 6;
        dead_zone = {
          command = "";
          middle_command = "";
          right_command = "";
          scroll_down_command = "";
          scroll_up_command = "";
        };
        monitor = {
          HDMI-A-1 = {
            auto_hide = false;
            background_opacity = 0.29999998211860657;
            border = "outline";
            border_width = 0.0;
            capsule = false;
            capsule_fill = "surface_variant";
            capsule_opacity = 1.0;
            capsule_padding = 6.0;
            capsule_thickness = 0.7599999904632568;
            center = [ "group:g1" ];
            concave_edge_corners = true;
            contact_shadow = false;
            enabled = true;
            end = [ "tray" "group:g2" "volume" "control-center" ];
            font_weight = 500;
            hover_highlight = true;
            layer = "top";
            margin_edge = 4;
            margin_ends = 4;
            margin_opposite_edge = 0;
            match = "HDMI-A-1";
            padding = 14;
            panel_overlap = 1;
            radius = 12;
            radius_bottom_left = 12;
            radius_bottom_right = 12;
            radius_top_left = 12;
            radius_top_right = 12;
            reserve_space = true;
            scale = 1.149999976158142;
            shadow = false;
            show_on_workspace_switch = true;
            smart_auto_hide = false;
            start = [ "workspaces" "nix_monitor_2" "status" ];
            thickness = 34;
            widget_spacing = 6;
            dead_zone = {
              command = "";
              middle_command = "";
              right_command = "";
              scroll_down_command = "";
              scroll_up_command = "";
            };
            capsule_group = [ {
              enabled = true;
              fill = "surface_variant";
              id = "g2";
              members = [ "battery" "clipboard" "bluetooth" "brightness" ];
              opacity = 1.0;
              padding = 6.0;
            } {
              enabled = true;
              fill = "surface_variant";
              id = "g1";
              members = [ "clock" "media" "notifications" "privacy" "mangowm-keymode" ];
              opacity = 1.0;
              padding = 6.0;
            } ];
          };
        };
        capsule_group = [ {
          enabled = true;
          fill = "surface_variant";
          id = "g2";
          members = [ "battery" "clipboard" "bluetooth" "brightness" ];
          opacity = 1.0;
          padding = 6.0;
        } {
          enabled = true;
          fill = "surface_variant";
          id = "g1";
          members = [ "clock" "media" "cat" "notifications" "privacy" "mangowm-keymode" ];
          opacity = 1.0;
          padding = 6.0;
        } ];
      };
    };
  };
}
