{...}:
{
  wayland.windowManager.mango.settings = {
    exec-once = [
      "spotify"
      "altus"
      "steam %U"
      "sleep 10; systemctl --user restart sunshine"
    ];
    monitorrule = [
      "name:DP-3,width:3440,height:1440,refresh:180,x:0,y:0,vrr:0"
    ];
    bind = [
      "SUPER+SHIFT,d,spawn,display-device -d pc-gambled"
    ];
  };
}
