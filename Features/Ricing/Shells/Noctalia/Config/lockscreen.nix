{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    lockscreen = {
      allow_empty_password = false;
      blur_intensity = 0.699999988079071;
      blurred_desktop = true;
      enabled = true;
      fingerprint = true;
      monitors = [  ];
      tint_intensity = 0.30000001192092896;
      wallpaper = "";
    };
  };
}
