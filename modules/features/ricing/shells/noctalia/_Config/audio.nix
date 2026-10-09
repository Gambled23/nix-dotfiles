{pkgs, ...}:{
  programs.noctalia.settings = {
    audio = {
      enable_notification_sounds = true;
      enable_overdrive = false;
      enable_power_sounds = true;
      enable_screenshot_sounds = true;
      enable_sounds = true;
      enable_volume_sounds = true;
      sound_theme = "freedesktop";
      sound_volume = 1.0;
    };
  };
}
