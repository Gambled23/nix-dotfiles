{...}:
{
  wayland.windowManager.mango.settings = {
    xkb_rules = {
      layout = "us";
      variant  = "altgr-intl";
    };
    
    mouse = {
      accel_profile = 0; # 0 = none
    };

    trackpad = {
      natural_scrolling = 1;
      accel_profile = 1; # 1 = flat
    };
  };
}