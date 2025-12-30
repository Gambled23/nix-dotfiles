# Home manager file
{ lib, ... }: {
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      modules = {
        left = [
          "Vicinae"
          "Workspaces"
        ];
        center = [
          "MediaPlayer"
        ];
        right = [
          [
            "Tray"
            "Privacy"
          ]
          [
            "Clock"
            "CustomNotifications"
          ]
          [
            "Settings"
          ]
        ];
      };
      workspaces = {
        disable_special_workspaces = true;
      };

      CustomModule = [
        {
          name = "CustomNotifications";
          icon = "";
          command = "swaync-client -t -sw";
          listen_cmd = "swaync-client -swb";
          alert = ".*notification";
        }
        {
          name = "Vicinae";
          icon = "󱗼";
          command = "vicinae toggle";
        }
      ];

      appearance = {
        style = "Solid";
        scale_factor = 1.3;
        opacity = lib.mkForce 0.6;
        menu = {
          opacity = lib.mkForce 0.7;
        };
        workspace_colors = lib.mkForce ["#98971a" "#98971a"];
      };
    };
  };
}