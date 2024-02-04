{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx"; # use glx instead of xrender for rounded corners bugs
    vSync = true;
    inactiveOpacity = 0.9;
    menuOpacity = 0.9;
    fade = true;
    fadeDelta = 5; # fade animation time in ms
    shadow = true;
    settings = {
      corner-radius = 7;
      blur = { method = "gaussian"; size = 10; deviation = 5.0; };
    };
  };
}

