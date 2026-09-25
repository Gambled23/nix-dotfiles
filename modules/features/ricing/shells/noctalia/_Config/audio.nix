{pkgs, ...}:{
  programs.noctalia.settings = {
    audio = {
      enable_overdrive = false;
      enable_sounds = true;
      sound_theme = "freedesktop";
      sound_volume = 1.0;
    };
  };
}
