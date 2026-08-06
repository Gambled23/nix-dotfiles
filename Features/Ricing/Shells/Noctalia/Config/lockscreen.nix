{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    lockscreen = {
      allow_empty_password = false;
      blur_intensity = 0.5;
      blurred_desktop = true;
      enabled = true;
      fingerprint = true;
      monitors = [  ];
      tint_intensity = 0.14999999105930328;
      wallpaper = "";
    };
  };
}
