{...}:
{
  wayland.windowManager.mango = {
    settings = {
      exec-once = [
        "kitty -e spotify_player"
        "kitty -e nchat"
        "sleep 2; noctalia msg session lock"
      ];

      windowrule =[
        "title:spotify_player,monitor:HDMI-A-1"
        "title:nchat,monitor:HDMI-A-1"
        "appid:Altus,monitor:HDMI-A-1"
        "appid:discord,monitor:HDMI-A-1"
        "appid:Spotify,monitor:HDMI-A-1"
        "appid:com.moonlight_stream.Moonlight,monitor:HDMI-A-1"
      ];
    };
  };
}