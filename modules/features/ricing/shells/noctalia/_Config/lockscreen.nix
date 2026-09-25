{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    lockscreen = {
      allow_empty_password = false;
      blur_intensity = 0.5;
      blurred_desktop = true;
      edge_smoothness = 0.30000001192092896;
      enabled = true;
      fingerprint = true;
      lock_before_suspend = true;
      monitors = [  ];
      tint_intensity = 0.14999999105930328;
      transition = [ "disc" ];
      transition_duration = 900.0;
      wallpaper = "";
    };
  };
}
