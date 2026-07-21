{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    lockscreen_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [ "lockscreen-widget-0000000000000005" "lockscreen-login-box@HDMI-A-1" "lockscreen-login-box@eDP-1" "lockscreen-login-box@HEADLESS-3" "lockscreen-login-box@sunshine" "lockscreen-login-box@DP-3" "lockscreen-widget-0000000000000001" "lockscreen-widget-0000000000000002" "lockscreen-widget-0000000000000003" "lockscreen-widget-0000000000000004" "lockscreen-widget-0000000000000006" "lockscreen-widget-0000000000000007" "lockscreen-widget-0000000000000008" "lockscreen-widget-0000000000000009" "lockscreen-widget-000000000000000b" "lockscreen-widget-000000000000000c" "lockscreen-widget-000000000000000a" ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget = {
        "lockscreen-login-box@DP-3" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 1720.0;
          cy = 1321.0;
          enabled = true;
          output = "DP-3";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
          };
        };
        "lockscreen-login-box@HDMI-A-1" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 960.0;
          cy = 961.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = true;
            input_opacity = 1.0;
            input_radius = 12.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
          };
        };
        "lockscreen-login-box@HEADLESS-3" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 960.0;
          cy = 961.0;
          enabled = true;
          output = "HEADLESS-3";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
          };
        };
        "lockscreen-login-box@eDP-1" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 960.0;
          cy = 1081.0;
          enabled = true;
          output = "eDP-1";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
          };
        };
        "lockscreen-login-box@sunshine" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 640.0;
          cy = 681.0;
          enabled = true;
          output = "sunshine";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
          };
        };
        lockscreen-widget-0000000000000001 = {
          box_height = 240.0;
          box_width = 496.0;
          cx = 1720.0;
          cy = 584.0;
          enabled = true;
          output = "DP-3";
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
          rotation = 0.0;
          type = "media_player";
          settings = {
            
          };
        };
        lockscreen-widget-0000000000000003 = {
          box_height = 304.0;
          box_width = 768.0;
          cx = 960.0;
          cy = 212.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "clock";
          settings = {
            background_radius = 24;
            color = "secondary";
          };
        };
        lockscreen-widget-0000000000000004 = {
          box_height = 176.0;
          box_width = 416.0;
          cx = 960.0;
          cy = 484.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "media_player";
          settings = {
            background_color = "surface";
            background_opacity = 0.75;
            background_radius = 24;
            color = "on_surface";
            hide_when_no_media = false;
            layout = "horizontal";
          };
        };
        lockscreen-widget-0000000000000005 = {
          box_height = 192.0;
          box_width = 400.0;
          cx = 960.0;
          cy = 484.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "fancy_audio_visualizer";
          settings = {
            background = false;
            visualization_mode = "wave_rings";
          };
        };
        lockscreen-widget-0000000000000006 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 816.0;
          cy = 1020.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "sysmon";
          settings = {
            display = "gauge";
            stat = "net_rx";
            stat2 = "cpu_temp";
          };
        };
        lockscreen-widget-0000000000000007 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1040.0;
          cy = 1020.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "sysmon";
          settings = {
            display = "gauge";
            stat = "ram_pct";
            stat2 = "";
          };
        };
        lockscreen-widget-0000000000000008 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1125.5;
          cy = 1020.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "sysmon";
          settings = {
            display = "gauge";
            gauge_layout = "horizontal";
            stat = "cpu_usage";
            stat2 = "cpu_temp";
          };
        };
        lockscreen-widget-0000000000000009 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 936.5;
          cy = 1020.0;
          enabled = true;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "sysmon";
          settings = {
            display = "gauge";
            stat = "net_tx";
            stat2 = "cpu_temp";
          };
        };
        lockscreen-widget-000000000000000a = {
          box_height = 368.0;
          box_width = 784.0;
          cx = 960.0;
          cy = 408.0;
          enabled = true;
          output = "eDP-1";
          rotation = 0.0;
          type = "clock";
          settings = {
            background = true;
            background_opacity = 0.8;
            background_radius = 24;
            center_text = false;
            clock_style = "digital";
            color = "secondary";
            font_family = "Liberation Sans";
          };
        };
        lockscreen-widget-000000000000000b = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 910.0;
          enabled = true;
          output = "eDP-1";
          rotation = 0.0;
          type = "media_player";
          settings = {
            
          };
        };
        lockscreen-widget-000000000000000c = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1796.0;
          cy = 70.0;
          enabled = true;
          output = "eDP-1";
          rotation = 0.0;
          type = "weather";
          settings = {
            
          };
        };
      };
    };
  };
}
