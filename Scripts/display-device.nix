{ pkgs }:
let 
  monitor = "DP-3";
in 

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  echo "Display device script"

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
      monique --switch-profile "steamdeck"
      ;;
    pc-gambled)
      monique --switch-profile "pc-gambled"
      ;;
    dev-gambled)
      monique --switch-profile "dev-gambled"
      ;;
    tv)
      monique --switch-profile "tv"
      sleep 2
      hyprctl dispatch "hl.dsp.focus({ workspace = 8 })"
      ;;  
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 
