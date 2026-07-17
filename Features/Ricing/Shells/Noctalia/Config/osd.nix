{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    osd = {
      background_opacity = 0.29999998211860657;
      border = true;
      monitors = [  ];
      offset_x = 20;
      offset_y = 8;
      orientation = "horizontal";
      position = "top_center";
      position_vertical = "center_right";
      scale = 1.0;
      kinds = {
        bluetooth = true;
        brightness = true;
        caffeine = true;
        dnd = true;
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
