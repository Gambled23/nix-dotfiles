{ pkgs, ... }:

{
  services.picom = {
    enable = true;

    activeOpacity = 1;
    inactiveOpacity = 0.8;
    fade = true;
  };
}