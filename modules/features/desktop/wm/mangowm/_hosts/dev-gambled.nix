{...}:
{
  wayland.windowManager.mango = {
    settings = {
      exec-once = [
        # "kitty --class spotify_player -e spotify_player"
        # "kitty --class nchat -e nchat"
      ];

      windowrule =[
        "appid:spotify_player,monitor:HDMI-A-1"
        "appid:nchat,monitor:HDMI-A-1"
        "appid:Altus,monitor:HDMI-A-1"
        "appid:discord,monitor:HDMI-A-1"
        "appid:Beeper,monitor:HDMI-A-1"
        "appid:spotify,monitor:HDMI-A-1"
        "appid:com.moonlight_stream.Moonlight,monitor:HDMI-A-1"
        "title:Nuvio,width:555,height:1165,isfloating:1,offsetx:100,offsety:100,monitor:eDP-1"
      ];
    };
  };
}
