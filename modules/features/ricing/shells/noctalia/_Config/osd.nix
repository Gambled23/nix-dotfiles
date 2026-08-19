{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    osd = {
      background_opacity = 0.09999999403953552;
      border = true;
      enabled = true;
      monitors = [  ];
      offset_x = 20;
      offset_y = 8;
      orientation = "horizontal";
      position = "top_center";
      position_vertical = "center_right";
      scale = 1.149999976158142;
      kinds = {
        bluetooth = true;
        brightness = true;
        caffeine = true;
        dnd = true;
        keyboard_backlight = true;
        keyboard_layout = true;
        lock_keys = true;
        media = true;
        nightlight = true;
        power_profile = true;
        privacy = true;
        volume = true;
        volume_input = true;
        volume_output = true;
        wifi = true;
      };
    };
  };
}
