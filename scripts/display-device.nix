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
    pc-gambled)
      kscreen-doctor output.DP-3.mode.3440x1440@180
      sudo systemctl stop openrgb
      sudo openrgb --server --profile "white_low.orp"
      ;;
    steamdeck)
      # shutdown rgb
      kscreen-doctor output.DP-3.mode.1280x800@60
      sudo systemctl stop openrgb
      sudo openrgb --server --profile "off.orp" 
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