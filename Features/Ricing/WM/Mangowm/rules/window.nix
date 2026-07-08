{...}:
{
  wayland.windowManager.mango.settings = {
    # windowrule = "tags:9,monitor:HDMI-A-1,appid:discord";
    windowrule =[
      "appid:Altus,tags:8,isopensilent:1"
      "appid:discord,tags:8,isopensilent:1"
      "appid:Spotify,tags:9,isopensilent:1"
      "title:spotify_player,tags:9,isopensilent:1"
      "appid:steam,tags:7,isopensilent:1"
      "appid:com.stremio.stremio,tags:6"
      "appid:hayase,tags:6"
      "title:ripdrag,focused_opacity:0.7,unfocused_opacity:0.7"
      "appid:mpv,width:284,height:161,isfloating:1"
      "appid:vlc,width:284,height:161,isfloating:1"
      "appid:.scrcpy-wrapped,width:284,height:161,isfloating:1"
      "title:Picture in picture,isfloating:1, width:284,height:161"
      "title:(Open File.*|Select Folder to Upload|Select a file),width:1150,height:700,isfloating:1"
      "title:(Keyguard),width:790,height:570,isfloating:1"
      "title:Yazi,width:600,height:400,isfloating:1"
      "appid:vicinae,allow_csd:1,isnoanimation:1"
    ];
  };
}