{...}:{
  imports = [
		../Colors/Templates/lazygit.nix
		../Colors/Templates/nchat.nix
		../Colors/Templates/nvf.nix
		../Colors/Templates/siyuan.nix
		../Colors/Templates/spicetify.nix
  ];

  programs.noctalia.settings = {
		theme = {
			builtin = "Noctalia";
			community_palette = "Oxocarbon";
			custom_palette = "";
			mode = "dark";
			source = "wallpaper";
			wallpaper_scheme = "m3-content";
			templates = {
				builtin_ids = [ "btop" "gtk3" "gtk4" "ghostty" "hyprland" "mango" "qt" "starship" ];
				community_ids = [ "spicetify" "neovim" "vscode" "vicinae" "discord" "papirus-icons" "steam" "yazi" "hyprtoolkit" ];
				enable_builtin_templates = true;
				enable_community_templates = true;
				user = {
					antigravity-ide = {
						compare_to = "";
						enabled = true;
						index = 0;
						input_path = "$XDG_CONFIG_HOME/noctalia/templates/spicetify.ini";
						output_path = [ "$XDG_CONFIG_HOME/noctalia/templates/ignore" ];
						output_path_dynamic = "";
						post_hook = "cp ~/.vscode/extensions/noctalia.noctaliatheme-*/themes/NoctaliaTheme-color-theme.json ~/.antigravity-ide/extensions/noctalia.noctaliatheme-*/themes/NoctaliaTheme-color-theme.json";
						pre_hook = "";
					};
					lazygit = {
						compare_to = "";
						enabled = true;
						index = 0;
						input_path = "$XDG_CONFIG_HOME/noctalia/templates/lazygit.yml";
						output_path = [ "$XDG_CONFIG_HOME/lazygit/config.yml" ];
						output_path_dynamic = "";
						post_hook = "";
						pre_hook = "";
					};
					nchat = {
						compare_to = "";
						enabled = true;
						index = 0;
						input_path = "$XDG_CONFIG_HOME/noctalia/templates/nchat.conf";
						output_path = [ "$XDG_CONFIG_HOME/nchat/color.conf" ];
						output_path_dynamic = "";
						post_hook = "";
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
						post_hook = "cp ~/.cache/noctalia/starship-palette.toml /etc/nixos/Features/Ricing/Shells/Noctalia/Colors/starship.toml";
						pre_hook = "";
					};
				};
			};
		};
  };
}