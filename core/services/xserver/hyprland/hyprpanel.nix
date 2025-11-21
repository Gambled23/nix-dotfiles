{ inputs, ... }:
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "media" ];
            right = [ "volume" "network" "bluetooth" "battery" "systray" "clock" "notifications" ];
          };
        };

        clock = {
          showTime = true;
          showIcon = true;
          format = "%a %b %d  %H:%M:%S";
        };
        launcher = {
          autoDetectIcon = true;
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
          show_numbered = true;
          numbered_active_indicator =  "highlight";
        };
      };

      menus = {
        clock = {
          weather = {
            location = "Mexico City";
            key = "XXXXXXXXX";
          };
        };
        dashboard = {
          stats = {
            enable_gpu = false;
            directories = {
              enabled = true;
              left = {
                directory1 = {
                  command = "dolphin $HOME/Downloads/";
                  label = "󰮛 Downloads";
                };
                directory2 = {
                  command = "dolphin $HOME/Videos/";
                  label = "󰉏 Videos";
                };
                directory3 = {
                  command = "dolphin $HOME/Codes/";
                  label = "󰚝 Codes";
                };
              };
              right = {
                directory1 = {
                  command = "dolphin $HOME/Documents";
                  label = "󱧶 Documents";
                };
                directory2 = {
                  command = "dolphin $HOME/Pictures";
                  label = "󰉏 Pictures";
                };
                directory3 = {
                  command = "dolphin $HOME/";
                  label = "󱂵 Home";
                };
              };
            };
          };
        };
        media.hideAuthor = false;
        media.hideAlbum = false;
        media.displayTime = false;
        media.displayTimeTooltip = false;
      };

      notifications = {
        showActionsOnHover = true;
        timeout = 5000;
      };
      
      theme = {
        bar = {
          buttons = {
            workspaces.smartHighlight = true;
            workspaces.pill.active_width = "12em";
            workspaces.pill.width = "4em";
            workspaces.numbered_active_highlight_border = "0.2em";
            y_margins = "0em";
            monochrome = false;
            opacity = 100;
            spacing = "0.2em";
            padding_x = "0.5rem";
          };
          dropdownGap = "2em";
          transparent = false;
          opacity = 70;
          outer_spacing = "0em";
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