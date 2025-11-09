{ ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "openrgb --profile 'off.orp'";
      };
    };
  };
}