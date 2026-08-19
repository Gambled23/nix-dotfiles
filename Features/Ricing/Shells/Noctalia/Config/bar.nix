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
        concave_edge_corners = false;
        contact_shadow = false;
        enabled = true;
        end = [ "tray" "group:g2" "volume" ];
        font_weight = 500;
        hover_highlight = true;
        layer = "top";
        margin_edge = 0;
        margin_ends = 0;
        margin_opposite_edge = 0;
        padding = 7;
        panel_overlap = 0;
        position = "top";
        radius = 0;
        radius_bottom_left = 0;
        radius_bottom_right = 0;
        radius_top_left = 0;
        radius_top_right = 0;
        reserve_space = true;
        scale = 1.149999976158142;
        shadow = false;
        show_on_workspace_switch = true;
        smart_auto_hide = false;
        start = [ "vicinae" "workspaces" ];
        thickness = 34;
        widget_spacing = 6;
        dead_zone = {
          
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
            concave_edge_corners = false;
            contact_shadow = false;
            enabled = true;
            end = [ "tray" "group:g2" "volume" "bar_2" ];
            font_weight = 500;
            hover_highlight = true;
            layer = "top";
            margin_edge = 0;
            margin_ends = 0;
            margin_opposite_edge = 0;
            match = "HDMI-A-1";
            padding = 7;
            panel_overlap = 0;
            radius = 0;
            radius_bottom_left = 0;
            radius_bottom_right = 0;
            radius_top_left = 0;
            radius_top_right = 0;
            reserve_space = true;
            scale = 1.149999976158142;
            shadow = false;
            show_on_workspace_switch = true;
            smart_auto_hide = false;
            start = [ "workspaces" "group:g3" "eyecare-widget" ];
            thickness = 34;
            widget_spacing = 6;
            dead_zone = {
              
            };
            capsule_group = [ {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g2";
              members = [ "battery" "clipboard" "bluetooth" "brightness" ];
              opacity = 1.0;
              padding = 6.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g1";
              members = [ "clock" "media" "notifications" "privacy" "mangowm-keymode" ];
              opacity = 1.0;
              padding = 6.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g3";
              members = [ "widget" "widget_2" "widget_3" ];
              opacity = 1.0;
              padding = 6.0;
            } ];
          };
        };
        capsule_group = [ {
          accordion = false;
          accordion_direction = "end";
          enabled = true;
          fill = "surface_variant";
          id = "g2";
          members = [ "battery" "clipboard" "bluetooth" "brightness" ];
          opacity = 1.0;
          padding = 6.0;
        } {
          accordion = false;
          accordion_direction = "end";
          enabled = true;
          fill = "surface_variant";
          id = "g1";
          members = [ "clock" "media" "notifications" "privacy" "mangowm-keymode" "status_2" "btn_3" ];
          opacity = 1.0;
          padding = 6.0;
        } ];
      };
    };
  };
}
