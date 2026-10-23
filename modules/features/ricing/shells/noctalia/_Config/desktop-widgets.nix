{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    desktop_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [ "desktop-widget-0000000000000006" "desktop-widget-0000000000000001" "desktop-widget-0000000000000005" "desktop-widget-0000000000000007" "desktop-widget-0000000000000008" "desktop-widget-0000000000000009" "desktop-widget-000000000000000a" "desktop-widget-000000000000000b" "desktop-widget-000000000000000e" "desktop-widget-000000000000000f" "desktop-widget-0000000000000012" "desktop-widget-0000000000000013" "desktop-widget-0000000000000014" "desktop-widget-0000000000000015" "desktop-widget-0000000000000016" ];
      grid = {
        cell_size = 8;
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
          placement_height = 0.0;
          placement_width = 0.0;
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
          placement_height = 0.0;
          placement_width = 0.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            
          };
        };
        desktop-widget-0000000000000006 = {
          box_height = 344.0;
          box_width = 896.0;
          cx = 960.0;
          cy = 220.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            background_opacity = 1.0;
            clock_style = "digital";
            format = "{:%H:%M}";
          };
        };
        desktop-widget-0000000000000007 = {
          box_height = 96.0;
          box_width = 208.0;
          cx = 1752.0;
          cy = 1004.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "weather";
          settings = {
            background_opacity = 1.0;
          };
        };
        desktop-widget-0000000000000008 = {
          box_height = 160.0;
          box_width = 368.0;
          cx = 848.0;
          cy = 956.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "media_player";
          settings = {
            album_art_background = true;
            audio_visualizer = true;
            background_opacity = 1.0;
            hide_when_no_media = true;
          };
        };
        desktop-widget-0000000000000009 = {
          box_height = 240.0;
          box_width = 616.0;
          cx = 960.0;
          cy = 1072.0;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            background_opacity = 1.0;
          };
        };
        desktop-widget-000000000000000a = {
          box_height = 224.0;
          box_width = 528.0;
          cx = 1648.0;
          cy = 1080.0;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "media_player";
          settings = {
            album_art_background = true;
            album_art_blur = 24;
            audio_visualizer = true;
            background_opacity = 1.0;
            hide_when_no_media = true;
          };
        };
        desktop-widget-000000000000000b = {
          box_height = 176.0;
          box_width = 288.0;
          cx = 960.0;
          cy = 500.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "sysmon";
          settings = {
            background_opacity = 1.0;
            display = "graph";
            gauge_layout = "horizontal";
            stat = "net_rx";
            stat2 = "net_tx";
          };
        };
        desktop-widget-000000000000000e = {
          box_height = 176.0;
          box_width = 288.0;
          cx = 656.0;
          cy = 500.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "sysmon";
          settings = {
            background_opacity = 1.0;
            display = "graph";
            gauge_layout = "horizontal";
            stat = "ram_pct";
            stat2 = "swap_pct";
          };
        };
        desktop-widget-000000000000000f = {
          box_height = 128.0;
          box_width = 304.0;
          cx = 352.0;
          cy = 104.95209503173828;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "yocraft/battery-widget:widget";
          settings = {
            background_opacity = 1.0;
          };
        };
        desktop-widget-0000000000000012 = {
          box_height = 336.0;
          box_width = 176.0;
          cx = 208.62078857421875;
          cy = 299.6494140625;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = -0.052046999335289;
          type = "remo/noctes:note";
          settings = {
            background = false;
            key = "nota-1";
            paper_height = 286;
            paper_width = 151;
          };
        };
        desktop-widget-0000000000000013 = {
          box_height = 160.0;
          box_width = 208.0;
          cx = 1152.0;
          cy = 956.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "volume";
          settings = {
            background_opacity = 1.0;
            scroll_step = 1;
          };
        };
        desktop-widget-0000000000000014 = {
          box_height = 392.0;
          box_width = 568.0;
          cx = 1628.0;
          cy = 236.0;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "calendar";
          settings = {
            background_opacity = 1.0;
          };
        };
        desktop-widget-0000000000000015 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 104.0;
          cy = 167.04791259765625;
          enabled = true;
          output = "eDP-1";
          placement_height = 1200.0;
          placement_width = 1920.0;
          rotation = 0.02806999906897545;
          type = "remo/noctes:note";
          settings = {
            background = false;
            key = "nota-2";
          };
        };
        desktop-widget-0000000000000016 = {
          box_height = 176.0;
          box_width = 288.0;
          cx = 1264.0;
          cy = 500.0;
          enabled = true;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "sysmon";
          settings = {
            background_opacity = 1.0;
            display = "graph";
            stat = "cpu_usage";
            stat2 = "cpu_temp";
          };
        };
      };
    };
  };
}
