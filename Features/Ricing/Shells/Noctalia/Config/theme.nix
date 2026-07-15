{ pkgs, config, lib, ... }:
{
  imports = [
		../Colors/Templates/nvf.nix
		../Colors/Templates/siyuan.nix
		../Colors/Templates/spicetify.nix
  ];

  programs.noctalia.settings = {
    theme = {
      builtin = "Ayu";
      community_palette = "Oxocarbon";
      custom_palette = "";
      mode = "dark";
      pure_black_dark = false;
      source = "wallpaper";
      wallpaper_scheme = "m3-content";
      templates = {
        builtin_ids = [ "btop" "gtk3" "gtk4" "ghostty" "hyprland" "mango" "qt" "starship" ];
        community_ids = [ "spicetify" "neovim" "vscode" "vicinae" "discord" "nchat" "papirus-icons" "steam" "yazi" "hyprtoolkit" "bat" "antigravity" ];
        enable_builtin_templates = true;
        enable_community_templates = true;
        user = {
          accela = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/accela.nix";
            output_path = [ "$XDG_CONFIG_HOME/Tachibana Labs/theme.conf" ];
            output_path_dynamic = "";
            post_hook = ''
              cfg="''${XDG_CONFIG_HOME:-$HOME/.config}/Tachibana Labs"
              src="$cfg/theme.conf"
              dst="$cfg/ACCELA.conf"
              for k in accent_color background_color user_accent_color user_background_color; do
                v=$(grep "^$k=" "$src" | cut -d= -f2-)
                if [ -n "$v" ]; then
                  sed -i "s|^$k=.*|$k=$v|" "$dst"
                fi
              done
              rm "$src"
            '';
            pre_hook = "";
          };
          nvf = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/nvf.nix";
            output_path = [ "/etc/nixos/Features/Ricing/Shells/Noctalia/Colors/nvf.nix" ];
            output_path_dynamic = "";
            post_hook = "";
            pre_hook = "";
          };
          siyuan = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/siyuan.css";
            output_path = [ "~/SiYuan/conf/appearance/themes/Noctalia/theme.css" ];
            output_path_dynamic = "";
            post_hook = "";
            pre_hook = "";
          };
          spicetify-nix = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/spicetify.ini";
            output_path = [ "/etc/nixos/Features/Ricing/Shells/Noctalia/Colors/spicetify.ini" ];
            output_path_dynamic = "";
            post_hook = "";
            pre_hook = "";
          };
          starship = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/starship.toml";
            output_path = [ "$XDG_CONFIG_HOME/noctalia/templates/ignore" ];
            output_path_dynamic = "";
            post_hook = "cp ~/.cache/noctalia/st22arship-palette.toml /etc/nixos/Features/Ricing/Shells/Noctalia/Colors/starship.toml";
            pre_hook = "";
          };
        };
      };
    };
  };
}
