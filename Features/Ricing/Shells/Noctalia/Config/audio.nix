{pkgs, ...}:{
  programs.noctalia.settings = {
    audio = {
      enable_overdrive = false;
      enable_sounds = true;
      notification_sound = "${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/completion-success.oga";
      sound_volume = 1.0;
      volume_change_sound = "${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/bell.oga";
    };
  };
}