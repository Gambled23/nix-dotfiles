{ ... }: {

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 0;
      modules-left = [
        "hyprland/workspaces"
        # "hyprland/window"
        "custom/divider"
        "cpu"
        "custom/divider"
        "memory"
      ];
      modules-center = [ 
        "mpris"
      ];
      modules-right = [
        "tray"
        "custom/divider"
        "bluetooth"
        "custom/divider"
        "pulseaudio"
        "custom/headsetcontrol"
        "custom/divider"
        "clock"
      ];
      "hyprland/window" = { format = "{}"; };
      "wlr/workspaces" = {
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
        all-outputs = true;
        on-click = "activate";
      };
      "backlight/slider"= {
          min= 0;
          max= 100;
          orientation = "horizontal";
          device = "intel_backlight";
      };
      bluetooth = {
        format = "{status}";
        format-connected = "ᛒ {device_alias}";
        format-connected-battery = "ᛒ {device_alias} {device_battery_percentage}%";
        format-disconnected = "ᛒ Off";
        tooltip = true;
        on-click = "bluetoothctl power on";
        on-right-click = "bluetoothctl power off";
        format-icons = {
          connected = " {device_alias}";
          disconnected = "ᛒ Off";
        };
      };
      cpu = {
        interval = 10;
        format = "🖥️ {usage}%";
        max-length = 10;
        on-click = "";
      };
      memory = {
        interval = 30;
        format = " 💾 {}%";
        format-alt = "💾 {used:0.1f}G";
        max-length = 10;
      };
      mpris = {
        format = "{artist} - {title}";
        max-length = 50;
      };
      tray = {
        icon-size = 18;
        tooltip = false;
        spacing = 10;
      };
      clock = {
        format = "{:%I:%M %p | %m/%d} ";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = "🔇 Muted";
        on-click = "pamixer -t";
        on-scroll-up = "pamixer -i 5";
        on-scroll-down = "pamixer -d 5";
        scroll-step = 5;
        format-icons = {
          headphone = "🎧";
          hands-free = "🎧";
          headset = "🎧";
          phone = "📱";
          portable = "";
          car = "🚗";
          default = [ "🚗" "🚗" "🚗" ];
        };
      };
      "pulseaudio#microphone" = {
        format = "{format_source}";
        tooltip = false;
        format-source = "🎤 {volume}%";
        format-source-muted = " Muted";
        on-click = "pamixer --default-source -t";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
      };
      "custom/divider" = {
        format = " | ";
        interval = "once";
        tooltip = false;
      };
      "custom/headsetcontrol" = {
        exec = "headsetcontrol -b 2>&1 | awk -F'Level: ' '/Level:/ {print $2}'";
        interval = 60;
        format = "🔋 {}";
        tooltip = false;
      };
      "custom/endright" = {
        format = "_";
        interval = "once";
        tooltip = false;
      };
    }];
  };
}