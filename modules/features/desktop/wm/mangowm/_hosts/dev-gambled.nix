{...}:
{
  wayland.windowManager.mango = {
    settings = {
      exec_once = [
        # "kitty --class spotify_player -e spotify_player"
        # "kitty --class nchat -e nchat"
      ];

      window_rule =[
        "app_id:spotify_player,monitor:HDMI-A-1"
        "app_id:nchat,monitor:HDMI-A-1"
        "app_id:Altus,monitor:HDMI-A-1"
        "app_id:discord,monitor:HDMI-A-1"
        "app_id:Beeper,monitor:HDMI-A-1"
        "app_id:spotify,monitor:HDMI-A-1"
        "app_id:com.moonlight_stream.Moonlight,monitor:HDMI-A-1"
        "title:Nuvio,width:555,height:1165,is_floating:1,offset_x:100,offset_y:100,monitor:eDP-1"
      ];

    monitor_rule = [
      "name:eDP-1,width:1920,height:1200,refresh:60,x:0,y:0,vrr:0"
      "name:HDMI-A-1,width:1920,height:1080,refresh:60,x:1920,y:0,vrr:0"
    ];
    };
  };
}
