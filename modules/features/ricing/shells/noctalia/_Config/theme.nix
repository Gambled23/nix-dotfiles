{ ... }:
{
  imports = [
		../_Colors/Templates/accela.nix
		../_Colors/Templates/beeper.nix
		../_Colors/Templates/nvf.nix
		# ../_Colors/Templates/spicetify.nix
		../_Colors/Templates/siyuan.nix
  ];

  programs.noctalia.settings = {
    theme = {
      builtin = "Eldritch";
      community_palette = "GruvboxAlt";
      custom_palette = "";
      mode = "dark";
      pure_black_dark = false;
      source = "wallpaper";
      wallpaper_scheme = "m3-fruit-salad";
      templates = {
        builtin_ids = [ "btop" "gtk3" "gtk4" "ghostty" "hyprland" "kitty" "mango" "qt" "starship" ];
        community_ids = [ "antigravity" "spicetify" "zen-browser" "discord" "nchat" "gimp" "libreoffice" "neovim" "obsidian" "vscode" "steam" "vicinae" "siyuan" "hyprtoolkit" "bat" "yazi" ];
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
            post_action = "";
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
          beeper = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/beeper.css";
            output_path = [ "$XDG_CONFIG_HOME/BeeperTexts/custom.css" ];
            output_path_dynamic = "";
            post_action = "";
            post_hook = "";
            pre_hook = "";
          };
          nvf = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/nvf.nix";
            output_path = [ "/etc/nixos/modules/features/ricing/shells/noctalia/_Colors/nvf.nix" ];
            output_path_dynamic = "";
            post_action = "";
            post_hook = "";
            pre_hook = "";
          };
          siyuan = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/siyuan.css";
            output_path = [ "~/SiYuan/conf/appearance/themes/noctalia-siyuan/theme.css" ];
            output_path_dynamic = "";
            post_action = "";
            post_hook = "";
            pre_hook = "";
          };
          spicetify-nix = {
            compare_to = "";
            enabled = true;
            index = 0;
            input_path = "$XDG_CONFIG_HOME/spicetify/Themes/Comfy/color.ini";
            output_path = [ "/etc/nixos/modules/features/ricing/shells/noctalia/_Colors/spicetify.ini" ];
            output_path_dynamic = "";
            post_action = "";
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
            post_action = "";
            post_hook = "cp ~/.cache/noctalia/st22arship-palette.toml /etc/nixos/Features/Ricing/Shells/Noctalia/Colors/starship.toml";
            pre_hook = "";
          };
        };
      };
    };
  };
}
