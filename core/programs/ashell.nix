# Home manager file
{ lib, ... }: {
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      modules = {
        left = [
          [
            "Clock"
          ]
          [
            "Vicinae"
            "Workspaces"
          ]
        ];
        center = [
          "MediaPlayer"
        ];
        right = [
          [
            "Privacy"
            "Tray"
            "Settings"
            "CustomNotifications"
          ]
        ];
      };
      clock = {
        format = "%R | %d/%b";
      };
      workspaces = {
        disable_special_workspaces = true;
        enable_workspace_filling = true;
      };
      settings = {
        shutdown_cmd = "sudo systemctl poweroff";
        suspend_cmd = "sudo systemctl start systemd-suspend";
        hibernate_cmd = "sudo systemctl hibernate";
        reboot_cmd = "sudo systemctl reboot";
        logout_cmd = "loginctl kill-user $(whoami)";
        lock_cmd = "ambxst lock &";
        audio_sinks_more_cmd = "pavucontrol -t 3";
        audio_sources_more_cmd = "pavucontrol -t 4";
        remove_airplane_btn = true;
        remove_idle_btn = true;
        battery_format = "Icon";
        peripheral_battery_format = "IconAndPercentage";
        indicators = ["Audio" "Bluetooth" "Network" "PeripheralBattery" "Battery"];
        bluetooth_more_cmd = "blueman-manager";
        # CustomButton = [
        #   {

        #   }
        # ];
      };

      CustomModule = [
        {
          name = "CustomNotifications";
          icon = "";
          command = "swaync-client -t -sw";
          listen_cmd = "swaync-client -swb";
          icons."dnd.*" = "";
          alert = ".*notification";
        }
        {
          name = "Vicinae";
          icon = "";
          command = "vicinae toggle";
        }
      ];

      appearance = {
        style = "Islands";
        scale_factor = 1.3;
        opacity = lib.mkForce 0.6;
        menu = {
          opacity = lib.mkForce 0.6;
        };
        workspace_colors = lib.mkForce ["#98971a" "#98971a"];
      };
    };
  };
}