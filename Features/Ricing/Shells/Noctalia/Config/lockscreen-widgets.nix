{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    lockscreen_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [ "lockscreen-widget-0000000000000003" "lockscreen-login-box@HDMI-A-1" "lockscreen-login-box@eDP-1" "lockscreen-login-box@HEADLESS-3" "lockscreen-login-box@sunshine" "lockscreen-login-box@DP-3" "lockscreen-widget-0000000000000001" "lockscreen-widget-0000000000000002" "lockscreen-widget-000000000000000e" ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget = {
        "lockscreen-login-box@DP-3" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 1720.0;
          cy = 1321.0;
          enabled = true;
          output = "DP-3";
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
        "lockscreen-login-box@HDMI-A-1" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 960.0;
          cy = 961.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = true;
            input_opacity = 1.0;
            input_radius = 12.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
        "lockscreen-login-box@HEADLESS-3" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 960.0;
          cy = 961.0;
          enabled = true;
          output = "HEADLESS-3";
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
        "lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 960.0;
          cy = 1081.0;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
        "lockscreen-login-box@sunshine" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 640.0;
          cy = 681.0;
          enabled = true;
          output = "sunshine";
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
        lockscreen-widget-0000000000000001 = {
          box_height = 240.0;
          box_width = 496.0;
          cx = 1720.0;
          cy = 584.0;
          enabled = true;
          output = "DP-3";
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            
          };
        };
        lockscreen-widget-0000000000000002 = {
          box_height = 160.0;
          box_width = 368.0;
          cx = 1720.0;
          cy = 816.0;
          enabled = true;
          output = "DP-3";
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "media_player";
          settings = {
            
          };
        };
        lockscreen-widget-0000000000000003 = {
          box_height = 304.0;
          box_width = 768.0;
          cx = 960.0;
          cy = 172.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            background_radius = 24;
            color = "secondary";
          };
        };
        lockscreen-widget-000000000000000e = {
          box_height = 304.0;
          box_width = 768.0;
          cx = 960.0;
          cy = 168.0;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            background_radius = 24;
            color = "secondary";
          };
        };
      };
    };
  };
}
