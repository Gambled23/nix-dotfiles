{pkgs, ...}:{
  programs.noctalia.settings = {
    audio = {
      enable_overdrive = false;
      enable_sounds = true;
      notification_sound = "/nix/store/mlwpi1mmw0l8cmg96jpi99w1609hbgnb-ocean-sound-theme-6.7.2/share/sounds/ocean/stereo/completion-success.oga";
      sound_volume = 1.0;
      volume_change_sound = "/nix/store/mlwpi1mmw0l8cmg96jpi99w1609hbgnb-ocean-sound-theme-6.7.2/share/sounds/ocean/stereo/bell.oga";
    };
  };
}
