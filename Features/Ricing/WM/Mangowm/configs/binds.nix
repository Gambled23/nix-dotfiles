{mangowm, ...}:
let 
  terminal="ghostty";
  file_manager = "${terminal} -e yazi";
  menu = "vicinae toggle";
  web_browser = "google-chrome-stable";
in 
{
  wayland.windowManager.mango.settings = {
    # Use lists for duplicate keys like bind and tagrule
    bind = [
      "ALT,Tab,toggleoverview"
      "ALT,r,setkeymode,extras"  # Enter resize mode
      "SUPER+SHIFT,r,reload_config"
      "SUPER,x,togglefloating"
      
      "SUPER,q,killclient"
      "SUPER,e,spawn,${file_manager}"
      "SUPER,r,spawn,${menu}"
      "SUPER,f,spawn,${web_browser}"
      "SUPER,Return,spawn,${terminal}"
      "SUPER,c,spawn,code"
      "SUPER,v,spawn,${terminal} -e vim"
      "SUPER,b,spawn,flatpak run com.artemchep.keyguard"
      "SUPER,m,spawn,noctalia-shell ipc call lockScreen lock"
      "SUPER,n,spawn,$termial -e nix-rbd"
      "SUPER,o,spawn,moonlight stream 'el sunchine' 'dev-gambled'"
      "SUPER,p,spawn,scrcpy --render-driver=opengl -S -w -K -b15M --power-off-on-close"
      "SUPER,Escape,spawn,${terminal} -e btop"

      # Scratchpads
      "SUPER+SHIFT,s,minimized"
      "SUPER+SHIFT,s,restore_minimized"
      "SUPER,s,toggle_scratchpad"

      # Tags
      "SUPER,1,view,1"
      "SUPER,2,view,2"
      "SUPER,3,view,3"
      "SUPER,4,view,4"
      "SUPER,5,view,5"
      "SUPER,6,view,6"
      "SUPER,7,view,7"
      "SUPER,8,view,8"
      "SUPER,9,view,9"
      "SUPER+SHIFT,1,tagsilent,1"
      "SUPER+SHIFT,2,tagsilent,2"
      "SUPER+SHIFT,3,tagsilent,3"
      "SUPER+SHIFT,4,tagsilent,4"
      "SUPER+SHIFT,5,tagsilent,5"
      "SUPER+SHIFT,6,tagsilent,6"
      "SUPER+SHIFT,7,tagsilent,7"
      "SUPER+SHIFT,8,tagsilent,8"
      "SUPER+SHIFT,9,tagsilent,9"
      "SUPER+SHIFT,0,tagsilent,0"

      # Windows
      "SUPER,h,focusdir,left"
      "SUPER,j,focusdir,down"
      "SUPER,k,focusdir,up"
      "SUPER,l,focusdir,right"
      "SUPER+SHIFT,h,exchange_client,left"
      "SUPER+SHIFT,j,exchange_client,down"
      "SUPER+SHIFT,k,exchange_client,up"
      "SUPER+SHIFT,l,exchange_client,right"
      "SUPER+SHIFT,h,scroller_stack,left"
      "SUPER+SHIFT,j,scroller_stack,down"
      "SUPER+SHIFT,k,scroller_stack,up"
      "SUPER+SHIFT,l,scroller_stack,right"

      # Media
      "ALT,1,spawn,playerctl previous"
      "ALT,2,spawn,playerctl play-pause"
      "ALT,3,spawn,playerctl next"
      "ALT,0,spawn,noctalia-shell ipc call volume increase"
      "ALT,9,spawn,noctalia-shell ipc call volume decrease"
      "ALT,8,spawn,noctalia-shell ipc call volume muteOutput"
      "NONE,XF86AudioRaiseVolume,spawn,noctalia-shell ipc call volume increase"
      "NONE,XF86AudioLowerVolume,spawn,noctalia-shell ipc call volume decrease"
      "NONE,XF86AudioMute,spawn,noctalia-shell ipc call volume muteOutput"
      "NONE,XF86MonBrightnessUp,spawn,noctalia-shell ipc call brightness increase"
      "NONE,XF86MonBrightnessDown,spawn,noctalia-shell ipc call brightness decrease"
    ];

    mousebind = [
      "SUPER,btn_left,moveresize,curmove"
      "SUPER,btn_right,moveresize,curresize"
    ];

    axisbind = [
      "SUPER,UP,viewtoleft_have_client"
      "SUPER,DOWN,viewtoright_have_client"
    ];

    tagrule = [
      "id:1,layout_name:dwindle"
      "id:2,layout_name:dwindle"
      "id:3,layout_name:dwindle"
      "id:4,layout_name:dwindle"
      "id:5,layout_name:dwindle"
      "id:6,layout_name:dwindle"
      "id:7,layout_name:dwindle"
      "id:8,layout_name:dwindle"
      "id:9,layout_name:scroller"
      "id:0,layout_name:dwindle"
    ];

    # Keymodes (submaps) for modal keybindings
    keymode = {
      extras = {
        bind = [
          "NONE,Escape,setkeymode,default"

        ];
      };
    };
  };
}