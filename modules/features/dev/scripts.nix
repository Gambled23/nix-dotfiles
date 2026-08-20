{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages = {
      nix-rbd = pkgs.writeShellScriptBin "nix-rbd" ''

        set -e
        cd /etc/nixos/
        git pull

        git add --all

        rebuild_mode="switch"

        if  [[ $1 = "-u" ]]; then
          sudo nix flake update
          rebuild_mode="boot"
        elif [[ $1 ]]; then
          rebuild_mode=$1
        fi

        nh os $rebuild_mode .

        git restore --staged modules/features/ricing/shells/noctalia/_Colors/nvf.nix modules/features/ricing/shells/noctalia/_Colors/spicetify.ini modules/features/ricing/shells/noctalia/_Colors/starship.toml
        git commit -m "nix-rbd $rebuild_mode from $(hostname)" || echo "No changes to commit"

        git push
        ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild complete: $rebuild_mode"

        if [[ $1 = "-u" ]]; then
          agc
          read -p "Press enter to reboot"
          reboot
        fi
      '';

      agc = pkgs.writeShellScriptBin "agc" ''
        nh clean all
        # sudo nix-collect-garbage --delete-older-than 2d --cores 16 && nix-collect-garbage --delete-older-than 2d --cores 16
        # nix store gc && sudo nix store optimise
        # sudo nix profile wipe-history

        # sudo rm /home/gambled/Pictures/Screenshots/*
        sudo rm -rf /home/gambled/.cache/

        echo "Sistema limpiado" | ${pkgs.clolcat}/bin/clolcat
      '';

      ssh-github = pkgs.writeShellScriptBin "ssh-github" ''
        ssh-keygen -t ed25519 -C "ipog71@gmail.com"
        eval "$(ssh-agent -s)"
        
        ssh-add ~/.ssh/id_ed25519
        echo "Copie la siguiente clave para agregarla a github" | ${pkgs.clolcat}/bin/clolcat
        cat ~/.ssh/id_ed25519.pub  
      '';

      display-device = pkgs.writeShellScriptBin "display-device" ''
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
      '';

      flash-kernelsu = pkgs.writeShellScriptBin "flash-kernelsu" ''
        android_kdeconnect_id=add58a14_05d3_43a6_821f_d741a767cf5e
        read -p "init_boot.img route: " init_boot
        kdeconnect-cli --device $android_kdeconnect_id --share $init_boot
        # wait for transfer to complete
        read -p "Press [Enter] key after sending init_boot patched image..."
        adb reboot fastboot
        cd ~/Downloads
        read -p "patched init_boot: " init_boot
        fastboot flash init_boot $init_boot
        fastboot reboot
      '';

      scrcpy-desktop-mode = pkgs.writeShellScriptBin "scrcpy-desktop-mode" ''
        hostname=$(hostname)
        case $hostname in
          pc-gambled)
            adb shell settings put global overlay_display_devices 3440x1440/280
          ;;
          dev-gambled)
            adb shell settings put global overlay_display_devices 1920x1080/170
          ;;
        esac
        
        DISPLAY_ID=$(scrcpy --list-displays 2>&1 | grep -o -e '--display-id=[0-9]*' | tail -n 1 | cut -d= -f2)
        scrcpy --display-id "$DISPLAY_ID" --window-title "desktop" --mouse=uhid --keyboard=uhid --render-driver=opengl -S -b10M --power-off-on-close
        adb shell settings put global overlay_display_devices none
      '';
    };
  };

  # 2. Expose a NixOS module that bundles them into systemPackages
  flake.nixosModules.coreScripts = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.system}.nix-rbd
      self.packages.${pkgs.system}.agc
      self.packages.${pkgs.system}.ssh-github
    ];
  };

  flake.nixosModules.desktopScripts = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.system}.display-device
      self.packages.${pkgs.system}.flash-kernelsu
      self.packages.${pkgs.system}.scrcpy-desktop-mode
    ];
  };
}
