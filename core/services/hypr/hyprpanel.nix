# Home manager file
{ inputs, lib, ... }:
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "media" ];
            right = [ "systray" "bluetooth" "clock" "volume" "notifications" ];
          };
        };

        clock = {
          showTime = true;
          showIcon = true;
          format = "%a %b %d - %H:%M:%S";
        };
        customModules = {
          hypridle = {
            isActiveCommand = "systemctl --user status hypridle.service | grep -q 'Active: active (running)' && echo 'yes' || echo 'no'";
            startCommand = "systemctl --user start hypridle.service";
            stopCommand = "systemctl --user stop hypridle.service";
          };
        };
        launcher = {
          autoDetectIcon = true;
        };
        media = {
          show_active_only = true;
          format =  "{title}";
        };
        network = {
          showWifiInfo = true;
        };
        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };
        volume = {
          scrollDown = "pamixer -d 2 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3";
          scrollUp =  "pamixer -i 2 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3";
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
      
      theme = lib.mkForce {
        bar = {
          background = "#282828";
          border.color = "#83a598";
          buttons = {
            background = "#282828";
            y_margins = "0em";
            monochrome = false;
            opacity = 100;
            spacing = "0.2em";
            padding_x = "0.5rem";
            background_opacity = 0;
            borderColor = "#83a598";
            icon = "#83a598";
            icon_background = "#282828";
            text = "#83a598";
            hover = "#504945";
            workspaces = {
              smartHighlight = true;
              pill = {
                active_width = "12em";
                width = "4em";
              };
              numbered_active_highlight_border = "0.2em";
              numbered_active_highlighted_text_color = "#282828";
              numbered_active_underline_color = "#fbf1c7";
              hover = "#a89984";
              active = "#989719";
              occupied = "#a89984";
              available = "#83a598";
              background = "#282828";
              border = "#fbf1c7";
            };
            dashboard = {
              icon = "#fe8018";
              background = "#282828";
              border = "#fabd2f";
            };
            media = {
              icon_background = "#242438";
              icon = "#989719";
              text = "#ebdbb2";
              background = "#282828";
              border = "#83a598";
            };
            volume = {
              icon = "#b16185";
              text = "#a89984";
              background = "#282828";
              border = "#fe8019";
              icon_background = "#fe8019";
            };
            network = {
              text = "#a89984";
              icon = "#d3869b";
              icon_background = "#d3869b";
              background = "#282828";
              border = "#d3869b";
            };
            bluetooth = {
              text = "#a89984";
              icon = "#488488";
              background = "#282828";
              border = "#83a598";
              icon_background = "#83a598";
            };
            battery = {
              text = "#a89984";
              icon = "#689d6a";
              background = "#282828";
              border = "#fabd2f";
              icon_background = "#fabd2f";
            };
            notifications = {
              total = "#ebdbb2";
              icon = "#d79920";
              background = "#282828";
              border = "#83a598";
              icon_background = "#83a598";
            };
            clock = {
              icon = "#cc241d";
              text = "#a89984";
              background = "#282828";
              border = "#d3869b";
              icon_background = "#d3869b";
            };
            systray = {
              background = "#282828";
              border = "#504945";
              customIcon = "#ebdbb2";
            };
            windowtitle = {
              background = "#282828";
              border = "#d3869b";
              icon = "#d3869b";
              icon_background = "#d3869b";
              text = "#d3869b";
            };
            modules = {
              cava = {
                background = "#282828";
                border = "#8ec07c";
                icon = "#8ec07c";
                icon_background = "#282828";
                text = "#8ec07c";
              };
              cpu = {
                background = "#282828";
                border = "#d3869b";
                icon = "#d3869b";
                icon_background = "#282828";
                text = "#d3869b";
              };
              hypridle = {
                background = "#282828";
                border = "#83a598";
                icon = "#83a598";
                icon_background = "#282828";
                text = "#83a598";
              };
              hyprsunset = {
                background = "#282828";
                border = "#fabd2f";
                icon = "#fabd2f";
                icon_background = "#282828";
                text = "#fabd2f";
              };
              kbLayout = {
                background = "#282828";
                border = "#83a598";
                icon = "#83a598";
                icon_background = "#282828";
                text = "#83a598";
              };
              microphone = {
                background = "#282828";
                border = "#b8bb26";
                icon = "#b8bb26";
                icon_background = "#282828";
                text = "#b8bb26";
              };
              netstat = {
                background = "#282828";
                border = "#b8bb26";
                icon = "#b8bb26";
                icon_background = "#282828";
                text = "#b8bb26";
              };
              power = {
                background = "#282828";
                border = "#282828";
                icon = "#fb4934";
                icon_background = "#282828";
              };
              ram = {
                background = "#282828";
                border = "#fabd2f";
                icon = "#fabd2f";
                icon_background = "#282828";
                text = "#fabd2f";
              };
              storage = {
                background = "#282828";
                border = "#83a598";
                icon = "#83a598";
                icon_background = "#282828";
                text = "#83a598";
              };
              submap = {
                background = "#282828";
                border = "#8ec07c";
                icon = "#8ec07c";
                icon_background = "#282828";
                text = "#8ec07c";
              };
              updates = {
                background = "#282828";
                border = "#d3869b";
                icon = "#d3869b";
                icon_background = "#282828";
                text = "#d3869b";
              };
              weather = {
                background = "#282828";
                border = "#fe8019";
                icon = "#fe8019";
                icon_background = "#282828";
                text = "#fe8019";
              };
              worldclock = {
                background = "#282828";
                border = "#d3869b";
                icon = "#d3869b";
                icon_background = "#d3869b";
                text = "#d3869b";
              };
            };
          };
          menus = {
            opacity = 85;
            background = "#282828";
            border.color = "#3c3836";
            cards = "#282828";
            label = "#83a598";
            text = "#ebdbb2";
            dimtext = "#665c54";
            feinttext = "#3c3836";
            popover = {
              background = "#3c3836";
              border = "#3c3836";
              text = "#83a598";
            };
            tooltip = {
              background = "#282828";
              text = "#ebdbb2";
            };
            dropdownmenu = {
              background = "#282828";
              divider = "#282828";
              text = "#ebdbb2";
            };
            buttons = {
              active = "#d3869b";
              default = "#83a598";
              disabled = "#665c54";
              text = "#3c3836";
            };
            switch = {
              disabled = "#3c3836";
              enabled = "#83a598";
              puck = "#504945";
            };
            check_radio_button = {
              active = "#83a598";
              background = "#3c3836";
            };
            iconbuttons = {
              active = "#83a598";
              passive = "#ebdbb2";
            };
            icons = {
              active = "#83a598";
              passive = "#665c54";
            };
            listitems = {
              active = "#83a598";
              passive = "#ebdbb2";
            };
            progressbar = {
              background = "#504945";
              foreground = "#83a598";
            };
            slider = {
              background = "#665c54";
              backgroundhover = "#504945";
              primary = "#83a598";
              puck = "#665c54";
            };
            menu = {
              volume = {
                label.color = "#d3869b";
                iconbutton = {
                  active = "#d3869b";
                  passive = "#ebdbb2";
                };
                audio_slider = {
                  primary = "#d3869b";
                  background = "#665c54";
                  backgroundhover = "#504945";
                  puck = "#665c54";
                };
                input_slider = {
                  primary = "#d3869b";
                  background = "#665c54";
                  backgroundhover = "#504945";
                  puck = "#665c54";
                };
                listitems = {
                  active = "#b8bb26";
                  passive = "#ebdbb2";
                };
                icons = {
                  active = "#d3869b";
                  passive = "#bdae93";
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
                text = "#ebdbb2";
              };
              battery = {
                label.color = "#8ec07b";
                listitems = {
                  active = "#b8bb26";
                  passive = "#ebdbb2";
                };
                icons = {
                  active = "#8ec07b";
                  passive = "#bdae93";
                };
                slider = {
                  primary = "#8ec07b";
                  background = "#665c54";
                  backgroundhover = "#504945";
                  puck = "#665c54";
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
                text = "#ebdbb2";
              };
              clock = {
                time = {
                  time = "#b8bb26";
                  timeperiod = "#fabd2f";
                };
                calendar = {
                  yearmonth = "#b8bb26";
                  weekdays = "#fe8018";
                  currentday = "#fabc2f";
                  days = "#ebdbb2";
                  contextdays = "#665c54";
                  paginator = "#d3869b";
                };
                weather = {
                  icon = "#fe8018";
                  stats = "#fabc2f";
                  status = "#8ec07c";
                  temperature = "#ebdbb2";
                  hourly = {
                    icon = "#fe8018";
                    temperature = "#ebdbb2";
                    time = "#b8bb26";
                  };
                  thermometer = {
                    cold = "#83a598";
                    extremelycold = "#83a598";
                    extremelyhot = "#fb4934";
                    hot = "#fe8019";
                    moderate = "#83a598";
                  };
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
                text = "#ebdbb2";
              };
              notifications = {
                label = "#fabc2f";
                switch = {
                  enabled = "#b8bb26";
                  disabled = "#3c3836";
                  puck = "#504945";
                  switch_divider = "#504945";
                };
                clear = "#fb4934";
                scrollbar.color = "#fabd2f";
                pager = {
                  button = "#fabd2f";
                  background = "#282828";
                  label = "#bdae93";
                };
                background = "#282828";
                border = "#3c3836";
                card = "#282828";
                no_notifications_label = "#3c3836";
              };
              bluetooth = {
                label.color = "#83a598";
                listitems = {
                  active = "#b8bb26";
                  passive = "#ebdbb2";
                };
                iconbutton.iconbutton = {
                  active = "#83a598";
                  passive = "#ebdbb2";
                };
                icons.icons = {
                  active = "#83a598";
                  passive = "#bdae93";
                };
                scroller.color = "#83a598";
                status = "#665c54";
                switch = {
                  enabled = "#83a598";
                  disabled = "#3c3836";
                  puck = "#504945";
                  switch_divider = "#504945";
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
                text = "#ebdbb2";
              };
              media = {
                song = "#b8bb26";
                artist = "#fe8018";
                album = "#d3869b";
                timestamp = "#ebdbb2";
                buttons = {
                  enabled = "#b8bb26";
                  background = "#a89984";
                  text = "#282828";
                  inactive = "#665c54";
                };
                slider = {
                  primary = "#b8bb26";
                  background = "#665c54";
                  backgroundhover = "#504945";
                  puck = "#665c54";
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
              };
              network = {
                label.color = "#d3869b";
                listitems = {
                  active = "#d3869b";
                  passive = "#ebdbb2";
                };
                iconbuttons = {
                  active = "#d3869b";
                  passive = "#ebdbb2";
                };
                icons = {
                  active = "#d3869b";
                  passive = "#bdae93";
                };
                scroller.color = "#d3869b";
                status.color = "#665c54";
                switch = {
                  enabled = "#d3869b";
                  disabled = "#3c3836";
                  puck = "#504945";
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
                text = "#ebdbb2";
              };
              dashboard = {
                profile.name = "#98971a";
                controls = {
                  disabled = "#665c54";
                  volume = {
                    background = "#b8bb26";
                    text = "#3c3836";
                  };
                  input = {
                    background = "#d3869b";
                    text = "#3c3836";
                  };
                  bluetooth = {
                    background = "#83a598";
                    text = "#3c3836";
                  };
                  wifi = {
                    background = "#fe8019";
                    text = "#3c3836";
                  };
                  notifications = {
                    background = "#fabd2f";
                    text = "#3c3836";
                  };
                };
                shortcuts = {
                  background = "#83a598";
                  text = "#3c3836";
                  recording = "#b8bb26";
                };
                directories = {
                  left = {
                    top.color = "#d3869b";
                    middle.color = "#fabd2f";
                    bottom.color = "#fb4934";
                  };
                  right = {
                    top.color = "#8ec07c";
                    middle.color = "#d3869b";
                    bottom.color = "#83a598";
                  };
                };
                monitors = {
                  bar_background = "#504945";
                  cpu = {
                    bar = "#fb4934";
                    icon = "#fb4934";
                    label = "#fb4934";
                  };
                  ram = {
                    bar = "#fabd2f";
                    icon = "#fabd2f";
                    label = "#fabd2f";
                  };
                  gpu = {
                    bar = "#b8bb26";
                    icon = "#b8bb26";
                    label = "#b8bb26";
                  };
                  disk = {
                    bar = "#d3869b";
                    icon = "#d3869b";
                    label = "#d3869b";
                  };
                };
                powermenu = {
                  sleep = "#fabd2f";
                  restart = "#fe8019";
                  logout = "#b8bb26";
                  shutdown = "#fb4934";
                  confirmation = {
                    background = "#282828";
                    card = "#282828";
                    border = "#3c3836";
                    label = "#98971a";
                    body = "#ebdbb2";
                    button_text = "#282828";
                    confirm = "#8ec07c";
                    deny = "#d3869b";
                  };
                };
                background.color = "#282828";
                border.color = "#3c3836";
                card.color = "#282828";
              };
              power = {
                buttons = {
                  sleep = {
                    background = "#282828";
                    icon = "#3c3836";
                    icon_background = "#83a598";
                    text = "#83a598";
                  };
                  restart = {
                    background = "#282828";
                    icon = "#3c3836";
                    icon_background = "#fe8019";
                    text = "#fe8019";
                  };
                  logout = {
                    background = "#282828";
                    icon = "#3c3836";
                    icon_background = "#b8bb26";
                    text = "#b8bb26";
                  };
                  shutdown = {
                    background = "#282828";
                    icon = "#3c3836";
                    icon_background = "#fb4934";
                    text = "#fb4934";
                  };
                };
                background.color = "#282828";
                border.color = "#3c3836";
              };
              systray = {
                dropdownmenu = {
                  background = "#282828";
                  divider = "#282828";
                  text = "#ebdbb2";
                };
              };
            };
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
        fonts = {
          name = "DejaVu Sans Mono";
          size = 10;
        };
        notification = {
          background = "#3c3836";
          border = "#3c3836";
          label = "#fabd2f";
          labelicon = "#d79921";
          text = "#ebdbb2";
          time = "#bdae93";
          actions = {
            background = "#b8bb26";
            text = "#3c3836";
          };
          close_button = {
            background = "#fb4934";
            label = "#282828";
          };
        };
        osd = {
          orientation = "horizontal";
          rientation = "horizontal";
          location = "bottom";
          enableShadow = false;
          border.size = "0em";
          margins = "7px 7px 200px 7px";
          muted_zero = true;
          opacity = 70;
          bar_color = "#989719";
          bar_container = "#282828";
          icon = "#282828";
          icon_container = "#b8bb26";
          label = "#989719";
          theme = {
            color = "#83a598";
            container = "#282828";
            empty_color = "#3c3836";
            overflow_color = "#fb4934";
          };
        };
      };
    };
  };
}