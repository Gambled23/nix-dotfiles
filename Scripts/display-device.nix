{ pkgs }:
let 
  monitor = "DP-3";
in 

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  desktop = $XDG_CURRENT_DESKTOP

  display_name=""
  CONFIG_FILE="$HOME/.config/display-device"

  # -d expects an argument, h is help, r is restore
  while getopts "hd:acr" opt; do
    case "$opt" in
      h)
        echo "Usage: display-device [options]"
        echo "  -d <display_name>   Switch to: 'pc-gambled', 'steamdeck', 'dev-gambled', 'tv'"
        echo "  -c                  Show current display configuration"
        echo "  -h                  Show this help"
        exit 0
        ;;
      d)
        display_name="$OPTARG"
        ;;
    esac
  done

  shift $((OPTIND - 1))

  if [ -z "$display_name" ]; then
    echo "No display name provided." >&2
    echo "Usage: display-device [options]" >&2
    echo "  -d <display_name>   Switch to: 'pc-gambled', 'steamdeck', 'dev-gambled', 'tv'" >&2
    exit 1
  fi

  case "$display_name" in
    steamdeck)
      steam steam://open/bigpicture
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "steamdeck"
      else 
        mmsg dispatch create_virtual_output
        wlr-randr --output HEADLESS-1 --pos 0,0 --custom-mode 1200x800@60Hz --transform normal
        wlr-randr --output DP-3 --off
      fi
      ;;
    pc-gambled)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "pc-gambled"
      else
        mmsg dispatch destroy_all_virtual_output
        wlr-randr --output DP-3 --on        
      fi
      ;;
    dev-gambled)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "dev-gambled"
      else
        mmsg dispatch create_virtual_output
        wlr-randr --output HEADLESS-1 --pos 0,0 --custom-mode 1920x1080@60Hz --transform normal
        wlr-randr --output DP-3 --off    
      fi
      ;;
    tv)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "tv"
        sleep 2
        hyprctl dispatch "hl.dsp.focus({ workspace = 8 })"
      else
        mmsg dispatch create_virtual_output
        wlr-randr --output HEADLESS-1 --pos 0,0 --custom-mode 1920x1080@60Hz --transform normal
        wlr-randr --output DP-3 --off    
      fi
      ;;  
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 
