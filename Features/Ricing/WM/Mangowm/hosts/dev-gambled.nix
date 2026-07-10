{...}:
{
  wayland.windowManager.mango = {
    settings = {
      exec-once = [
        "ghostty -e spotify_player"
        "ghostty -e nchat"
        "sleep 2; noctalia msg session lock"
      ];

      windowrule =[
        "title:spotify_player,monitor:HDMI-A-1"
        "appid:Altus,monitor:HDMI-A-1"
        "appid:discord,monitor:HDMI-A-1"
        "appid:Spotify,monitor:HDMI-A-1"
        "appid:com.moonlight_stream.Moonlight,monitor:HDMI-A-1"
      ];
    };
  };
}