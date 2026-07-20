{...}:
{
  wayland.windowManager.mango = {
    settings = {
      exec-once = [
        "kitty --class spotify_player -e spotify_player"
        "kitty --class nchat -e nchat"
        "sleep 2; noctalia msg session lock"
      ];

      windowrule =[
        "appid:spotify_player,monitor:HDMI-A-1"
        "appid:nchat,monitor:HDMI-A-1"
        "appid:Altus,monitor:HDMI-A-1"
        "appid:discord,monitor:HDMI-A-1"
        "appid:Spotify,monitor:HDMI-A-1"
        "appid:com.moonlight_stream.Moonlight,monitor:HDMI-A-1"
      ];
    };
  };
}