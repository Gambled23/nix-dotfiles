# Home manager file
{ ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "ambxst lock";
        after_sleep_cmd = "hyprctl dispatch dpms on && openrgb --profile 'off.orp'";
      };
    };
  };
}