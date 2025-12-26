{ pkgs }:

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  echo "Display device script"

  display_name=""

  # -d expects an argument, h is help
  while getopts "hd:" opt; do
    case "$opt" in
      h)
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck'"
        echo "  -h                  Show this help"
        exit 0
        ;;
      d)
        display_name="$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck'"
        echo "  -h                  Show this help"
        exit 1
        ;;
    esac
  done

  shift $((OPTIND - 1))

  if [ -z "$display_name" ]; then
    echo "No display name provided." >&2
    usage
    exit 1
  fi

  case "$display_name" in
    steamdeck)
      hyprctl keyword monitor "DP-3, disable"
      hyprctl keyword monitor "sunshine,1280x800@60,0x0,1"
      hyprctl dispatch workspace 8
      steam steam://open/bigpicture 
      ;;
    pc-gambled)
      hyprctl keyword monitor "DP-3,3440x1440@180,0x0,1"
      hyprctl keyword monitor "sunshine, disable"
      ;;
    dev-gambled)
      hyprctl keyword monitor "DP-3, disable"
      hyprctl keyword monitor "sunshine,1920x1080@60,1920x0,1"
      ;;
    android-gambled)
      hyprctl keyword monitor "DP-3, disable"
      hyprctl keyword monitor "sunshine,2400x1080@90,0x0,1"
      ;;
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck'"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 