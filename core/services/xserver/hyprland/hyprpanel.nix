{ inputs, ... }:
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar.layouts = {
        "0" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ 
            "notifications" "volume" "network" "bluetooth" "battery" "systray" "clock" 
          ];
        };
      };

      bar = {
        clock = {
          showTime = true;
          showIcon = true;
          format = "%a %b %d  %H:%M:%S";
        };
        media = {
          show_active_only = true;
        };
        network = {
          showWifiInfo = true;
        };
        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };
        volume = {
          scrollDown = "hyprpanel vol -1";
          scrollUp =  "hyprpanel vol +1";
        };
        workspaces = {
          show_icons = false;
          show_numbered = false;
          numbered_active_indicator =  "highlight";
        };
      };

      menus = {
        media.hideAuthor = false;
        media.hideAlbum = false;
        media.displayTime = false;
        media.displayTimeTooltip = false;
        clock.weather.location = "Mexico City";
        clock.weather.key = "XXXXXXXXX";
        dashboard.stats.enable_gpu = false;
        dashboard.directories.enabled = true;
      };
      notifications = {
        showActionsOnHover = true;
        timeout = 5000;
      };
      theme = {
        bar = {
          transparent = false;
          outer_spacing = "0em";
          buttons = {
            workspaces.smartHighlight = true;
            workspaces.pill.active_width = "12em";
            workspaces.pill.width = "4em";
            workspaces.numbered_active_highlight_border = "0.2em";
            y_margins = "0em";
          };
        };
        font = {
          name = "CaskaydiaCove NF";
          size = "16px";
        };
        osd = {
          orientation = "horizontal";
          rientation = "horizontal";
          location = "bottom";
          enableShadow = true;
          border.size = "0em";
          margins = "7px 7px 200px 7px";
          muted_zero = true;
        };
      };
    };
  };
}