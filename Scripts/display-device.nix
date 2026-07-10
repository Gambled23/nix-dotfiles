{ pkgs }:
let 
  monitor = "DP-3";
in 

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  desktop=$XDG_CURRENT_DESKTOP

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

  mmsg dispatch destroy_all_virtual_output

  case "$display_name" in
    steamdeck)
      steam steam://open/bigpicture
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "steamdeck"
      elif [ "$desktop" = "mango" ]; then 
        mmsg dispatch create_virtual_output
        virtual_monitor=$(${pkgs.wlr-randr}/bin/wlr-randr | grep 'HEADLESS-' | cut -d ' ' -f1)
        ${pkgs.wlr-randr}/bin/wlr-randr --output DP-3 --off    
        ${pkgs.wlr-randr}/bin/wlr-randr --output $virtual_monitor --pos 0,0 --custom-mode 1280x800@60Hz --transform normal
      else
        echo "$desktop not configured"
      fi
      ;;
    pc-gambled)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "pc-gambled"
      elif [ "$desktop" = "mango" ]; then 
        ${pkgs.wlr-randr}/bin/wlr-randr --output DP-3 --on        
      else
        echo "$desktop not configured"
      fi
      ;;
    dev-gambled)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "dev-gambled"
      elif [ "$desktop" = "mango" ]; then 
        mmsg dispatch create_virtual_output
        virtual_monitor=$(${pkgs.wlr-randr}/bin/wlr-randr | grep 'HEADLESS-' | cut -d ' ' -f1)
        ${pkgs.wlr-randr}/bin/wlr-randr --output DP-3 --off    
        ${pkgs.wlr-randr}/bin/wlr-randr --output $virtual_monitor --pos 0,0 --custom-mode 1920x1080@60Hz --transform normal
      else
        echo "$desktop not configured"
      fi
      ;;
    pixel)
      if [ "$desktop" = "Hyprland" ]; then 
        monique --switch-profile "pixel"
        sleep 2
        hyprctl dispatch "hl.dsp.focus({ workspace = 8 })"
      elif [ "$desktop" = "mango" ]; then 
        mmsg dispatch create_virtual_output
        virtual_monitor=$(${pkgs.wlr-randr}/bin/wlr-randr | grep 'HEADLESS-' | cut -d ' ' -f1)
        ${pkgs.wlr-randr}/bin/wlr-randr --output DP-3 --off    
        ${pkgs.wlr-randr}/bin/wlr-randr --output $virtual_monitor --pos 0,0 --custom-mode 2992x1344@120Hz --transform normal
      else
        echo "$desktop not configured"
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
