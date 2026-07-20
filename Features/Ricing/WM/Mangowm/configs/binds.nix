{...}:
let 
  terminal="kitty";
  modal_terminal="kitten quick-access-terminal";
  file_manager = "${terminal} --class yazi -e yazi";
  menu = "vicinae toggle";
  web_browser = "google-chrome-stable";
  noctalia_ipc = "noctalia msg";
in 
{
  wayland.windowManager.mango.settings = {
    # Use lists for duplicate keys like bind and tagrule
    bind = [
      "none,Print,spawn,${noctalia_ipc} screenshot-region"
      "ALT,Tab,toggleoverview"
      "SUPER+SHIFT,r,reload_config"
      "SUPER,x,togglefloating"
      
      "SUPER,q,killclient"
      "SUPER+SHIFT,q,quit" # close mangowm
      "SUPER+SHIFT,s,switch_layout"
      "ALT,e,set_proportion,1.0"
      "ALT,x,switch_proportion_preset"
      "SUPER,e,spawn,${file_manager}"
      "SUPER,r,spawn,${menu}"
      "SUPER,f,spawn,${web_browser}"
      "SUPER+SHIFT,Return,spawn,${terminal}"
      "SUPER,Return,spawn,${modal_terminal}"
      "SUPER,c,spawn,antigravity-ide"
      "SUPER,v,spawn,${terminal} --class vim -e vim"
      "SUPER,b,spawn,flatpak run com.artemchep.keyguard"
      "SUPER,m,spawn,${noctalia_ipc} session lock"
      "SUPER,n,spawn,${terminal} --class nix-rbd -e nix-rbd"
      "SUPER,o,spawn,moonlight stream 'el sunchine' 'dev-gambled'"
      "SUPER,p,spawn,scrcpy --render-driver=opengl -S -w -K -b15M --power-off-on-close"
      "SUPER+SHIFT,p,spawn,scrcpy --new-display=1920x1080/180 --render-driver=opengl -MK -b10M --power-off-on-close"
      "SUPER,Escape,spawn,${terminal} --class btop -e btop"

      # Scratchpad
      "SUPER,z,minimized"
      "SUPER+SHIFT,z,restore_minimized"
      "SUPER,s,toggle_scratchpad"

      # Tags
      "SUPER,1,comboview,1"
      "SUPER,2,comboview,2"
      "SUPER,3,comboview,3"
      "SUPER,4,comboview,4"
      "SUPER,5,comboview,5"
      "SUPER,6,comboview,6"
      "SUPER,7,comboview,7"
      "SUPER,8,comboview,8"
      "SUPER,9,comboview,9"
      "SUPER,Tab,view,-1"
      "SUPER+SHIFT,1,tagsilent,1"
      "SUPER+SHIFT,2,tagsilent,2"
      "SUPER+SHIFT,3,tagsilent,3"
      "SUPER+SHIFT,4,tagsilent,4"
      "SUPER+SHIFT,5,tagsilent,5"
      "SUPER+SHIFT,6,tagsilent,6"
      "SUPER+SHIFT,7,tagsilent,7"
      "SUPER+SHIFT,8,tagsilent,8"
      "SUPER+SHIFT,9,tagsilent,9"

      # Windows
      # Focus
      "SUPER,Up,focusdir,up"
      "SUPER,Down,focusdir,down"
      "SUPER,Left,focusdir,left"
      "SUPER,Right,focusdir,right"
      "SUPER,h,focusdir,left"
      "SUPER,j,focusdir,down"
      "SUPER,k,focusdir,up"
      "SUPER,l,focusdir,right"

      # Exchange
      "SUPER+SHIFT,Up,exchange_client,up"
      "SUPER+SHIFT,Down,exchange_client,down"
      "SUPER+SHIFT,Left,exchange_client,left"
      "SUPER+SHIFT,Right,exchange_client,right"
      "SUPER+SHIFT,h,exchange_client,left"
      "SUPER+SHIFT,j,exchange_client,down"
      "SUPER+SHIFT,k,exchange_client,up"
      "SUPER+SHIFT,l,exchange_client,right"

      # Move
      "SUPER+ALT,Up,movewin,+0,-50"
      "SUPER+ALT,Down,movewin,+0,+50"
      "SUPER+ALT,Left,movewin,-50,+0"
      "SUPER+ALT,Right,movewin,+50,+0"
      "SUPER+ALT,k,movewin,+0,-50"
      "SUPER+ALT,j,movewin,+0,+50"
      "SUPER+ALT,h,movewin,-50,+0"
      "SUPER+ALT,l,movewin,+50,+0"

      # Resize
      "SUPER+CTRL,Up,resizewin,+0,-50"
      "SUPER+CTRL,Down,resizewin,+0,+50"
      "SUPER+CTRL,Left,resizewin,-50,+0"
      "SUPER+CTRL,Right,resizewin,+50,+0"
      "SUPER+CTRL,k,resizewin,+0,-50"
      "SUPER+CTRL,j,resizewin,+0,+50"
      "SUPER+CTRL,h,resizewin,-50,+0"
      "SUPER+CTRL,l,resizewin,+50,+0"


      # "SUPER+SHIFT,h,scroller_stack,left"
      # "SUPER+SHIFT,j,scroller_stack,down"
      # "SUPER+SHIFT,k,scroller_stack,up"
      # "SUPER+SHIFT,l,scroller_stack,right"

      # Media
      "ALT,1,spawn,playerctl previous"
      "ALT,2,spawn,playerctl play-pause"
      "ALT,3,spawn,playerctl next"
      "ALT,0,spawn,${noctalia_ipc} volume-up 1"
      "ALT,9,spawn,${noctalia_ipc} volume-down 1"
      "ALT,8,spawn,${noctalia_ipc} volume-mute"
      "NONE,XF86AudioRaiseVolume,spawn,${noctalia_ipc} volume-up 1"
      "NONE,XF86AudioLowerVolume,spawn,${noctalia_ipc} volume-down 1"
      "NONE,XF86AudioMute,spawn,${noctalia_ipc} volume-mute"
      "NONE,XF86MonBrightnessUp,spawn,${noctalia_ipc} brightness-up"
      "NONE,XF86MonBrightnessDown,spawn,${noctalia_ipc} brightness-down"

      # Keymaps
      "ALT,c,setkeymode,resize"  # Enter resize mode
      "ALT,v,setkeymode,vicinae"  # Enter resize mode
    ];

    mousebind = [
      "SUPER,btn_left,moveresize,curmove"
      "SUPER,btn_right,moveresize,curresize"
    ];

    axisbind = [
      "SUPER,UP,viewtoleft_have_client"
      "SUPER,DOWN,viewtoright_have_client"
    ];

    gesturebind = [
      "none,left,3,focusdir,left"
      "none,right,3,focusdir,right"
      "none,up,3,focusdir,up"
      "none,down,3,focusdir,down"
      "none,down,4,viewtoleft,0"
      "none,up,4,viewtoright,0"
      "none,left,4,toggleoverview"
      "none,right,4,toggleoverview"
    ];

    # Keymodes (submaps) for modal keybindings
    keymode = {
      resize = {
        bind = [
          "NONE,Escape,setkeymode,default"
          "NONE,z,moveresize,curmove"
          "NONE,x,moveresize,curresize"
        ];
      };
      vicinae = {
        bind = [
          "NONE,Escape,setkeymode,default"
          "SUPER,Super_L,spawn,${menu}"
          "SUPER,p,spawn,vicinae vicinae://launch/@knoopx/vicinae-extension-nix-0/packages"
        ];
      };
    };
  };
}
