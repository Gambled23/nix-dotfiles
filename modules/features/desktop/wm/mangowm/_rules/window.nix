{...}:
{
  wayland.windowManager.mango.settings = {
    # window_rule = "tags:9,monitor:HDMI-A-1,app_id:discord";
    window_rule =[
      "app_id:Altus,tags:8,is_open_silent:1"
      "app_id:Beeper,tags:8,is_open_silent:1"
      "app_id:discord,tags:8,is_open_silent:1"
      "app_id:spotify,tags:9,is_open_silent:1"
      "app_id:spotifast,tags:9,is_open_silent:1"
      # "app_id:spotify_player,tags:9,is_open_silent:1"
      "app_id:steam,tags:7,is_open_silent:1"
      "app_id:com.stremio.stremio,tags:6"
      "app_id:hayase,tags:6"
      "title:ripdrag,focused_opacity:0.7,unfocused_opacity:0.7"
      "app_id:mpv,width:419,height:237,is_floating:1"
      "app_id:vlc,width:419,height:237,is_floating:1"
      "app_id:kitty,is_term:1"

      "title:Picture in picture,is_floating:1, width:284,height:161"
      "title:(Open File.*|Select Folder to Upload|Select a file),width:1150,height:700,is_floating:1"
      "title:(Keyguard),width:911,height:655,is_floating:1"
      "app_id:yazi,width:1280,height:800,is_floating:1"
      "app_id:vicinae,no_animation:1"
      # "title:\,,app_id:com.mitchellh.ghostty,is_open_silent:1,tags:5"

      "title:phone,app_id:.scrcpy-wrapped,width:447,height:993,is_floating:1"
      "title:desktop,app_id:.scrcpy-wrapped,tags:1,is_fullscreen:1,is_fake_fullscreen:0"
      "title:audio,app_id:.scrcpy-wrapped,tags:6,is_named_scratchpad:1,is_open_silent:1"
    ];
  };
}
