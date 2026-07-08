# Home manager file
{ lib, inputs, pkgs, config, osConfig, ... }:
let
  noctalia_settings = 
{
	audio = {
		enable_sounds = true;
		notification_sound = "/nix/store/gqr6pb1k35ipkp4icslxkg4anrf9wivb-ocean-sound-theme-6.6.5/share/sounds/ocean/stereo/completion-success.oga";
		sound_volume = 1;
		volume_change_sound = "/nix/store/gqr6pb1k35ipkp4icslxkg4anrf9wivb-ocean-sound-theme-6.6.5/share/sounds/ocean/stereo/bell.oga";
	};
	bar = {
		autoHideDelay = 500;
		autoShowDelay = 150;
		backgroundOpacity = 0.2;
		barType = "framed";
		capsuleColorKey = "none";
		capsuleOpacity = 1;
		contentPadding = 2;
		density = "comfortable";
		displayMode = "always_visible";
		enableExclusionZoneInset = true;
		fontScale = 1;
		frameRadius = 10;
		frameThickness = 4;
		hideOnOverview = false;
		marginHorizontal = 4;
		marginVertical = 4;
		middleClickAction = "controlCenter";
		middleClickCommand = "";
		middleClickFollowMouse = false;
		monitors = [ "eDP-1" "DP-3" "HDMI-A-1" "sunshine" ];
		mouseWheelAction = "workspace";
		mouseWheelWrap = true;
		order = [ "widgets" ];
		outerCorners = false;
		position = "top";
		reverseScroll = false;
		rightClickAction = "controlCenter";
		rightClickCommand = "";
		rightClickFollowMouse = true;
		showCapsule = true;
		showOnWorkspaceSwitch = true;
		showOutline = false;
		useSeparateOpacity = false;
		widgetSpacing = 6;
		widgets = {
			background_opacity = 0.29999999329447746;
			center = [ "group:g1" ];
			end = [ "tray" "group:g2" "volume" "control-center" ];
			margin_edge = 4;
			margin_ends = 4;
			scale = 1.1500000096857548;
			shadow = false;
			start = [ "vicinae" "workspaces" ];
			capsule_group = [ {
				fill = "surface_variant";
				id = "g2";
				members = [ "battery" "clipboard" "bluetooth" "brightness" ];
				opacity = 1.0;
				padding = 6.0;
			} {
				fill = "surface_variant";
				id = "g1";
				members = [ "clock" "media" "notifications" "privacy" ];
				opacity = 1.0;
				padding = 6.0;
			} ];
		};
	};
	calendar = {
		enabled = true;
		account = {
			personal_google = {
				name = "ipog71";
				type = "google";
			};
		};
	};
	control_center = {
		width = 800;
		shortcuts = [ {
			type = "wifi";
		} {
			type = "bluetooth";
		} {
			type = "notification";
		} {
			type = "dark_mode";
		} {
			type = "caffeine";
		} {
			type = "audio";
		} ];
	};
	desktop_widgets = {
		schema_version = 2;
		widget_order = [ "desktop-widget-0000000000000006" "desktop-widget-0000000000000001" "desktop-widget-0000000000000005" "desktop-widget-0000000000000007" "desktop-widget-0000000000000008" "desktop-widget-0000000000000009" "desktop-widget-000000000000000a" ];
		grid = {
			cell_size = 16;
			major_interval = 4;
			visible = true;
		};
		widget = {
			desktop-widget-0000000000000001 = {
				box_height = 288.0;
				box_width = 656.0;
				cx = 368.0;
				cy = 218.0;
				output = "DP-3";
				rotation = 0.0;
				type = "media_player";
				settings = {
					layout = "horizontal";
				};
			};
			desktop-widget-0000000000000005 = {
				box_height = 256.0;
				box_width = 464.0;
				cx = 3080.0;
				cy = 1232.0;
				output = "DP-3";
				rotation = 0.0;
				type = "clock";
			};
			desktop-widget-0000000000000006 = {
				box_height = 192.0;
				box_width = 352.0;
				cx = 960.0;
				cy = 188.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "clock";
			};
			desktop-widget-0000000000000007 = {
				box_height = 96.0;
				box_width = 208.0;
				cx = 1752.0;
				cy = 1004.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "weather";
			};
			desktop-widget-0000000000000008 = {
				box_height = 160.0;
				box_width = 368.0;
				cx = 312.0;
				cy = 188.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "media_player";
			};
			desktop-widget-0000000000000009 = {
				box_height = 256.0;
				box_width = 768.0;
				cx = 448.0;
				cy = 216.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "clock";
			};
			desktop-widget-000000000000000a = {
				box_height = 224.0;
				box_width = 528.0;
				cx = 1592.0;
				cy = 1064.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "media_player";
			};
		};
	};
	dock = {
		auto_hide = true;
		background_opacity = 0.3;
		enabled = true;
		monitors = [  ];
		position = "bottom";
		reserve_space = false;
		shadow = false;
	};
	location = {
		auto_locate = true;
	};
	lockscreen = {
		blur_intensity = 0.6999999843537807;
		blurred_desktop = true;
	};
	lockscreen_widgets = {
		enabled = true;
		schema_version = 2;
		widget_order = [ "lockscreen-widget-0000000000000005" "lockscreen-login-box@HDMI-A-1" "lockscreen-login-box@eDP-1" "lockscreen-login-box@HEADLESS-3" "lockscreen-login-box@sunshine" "lockscreen-login-box@DP-3" "lockscreen-widget-0000000000000001" "lockscreen-widget-0000000000000002" "lockscreen-widget-0000000000000003" "lockscreen-widget-0000000000000004" "lockscreen-widget-0000000000000006" "lockscreen-widget-0000000000000007" "lockscreen-widget-0000000000000008" "lockscreen-widget-0000000000000009" "lockscreen-widget-000000000000000a" "lockscreen-widget-000000000000000b" "lockscreen-widget-000000000000000c" ];
		grid = {
			cell_size = 16;
			major_interval = 4;
			visible = true;
		};
		widget = {
			"lockscreen-login-box@DP-3" = {
				box_height = 70.0;
				box_width = 400.0;
				cx = 1720.0;
				cy = 1321.0;
				output = "DP-3";
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					input_opacity = 1.0;
					input_radius = 6.0;
					show_login_button = true;
				};
			};
			"lockscreen-login-box@HDMI-A-1" = {
				box_height = 70.0;
				box_width = 400.0;
				cx = 960.0;
				cy = 961.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					input_opacity = 1.0;
					input_radius = 6.0;
					show_login_button = true;
				};
			};
			"lockscreen-login-box@HEADLESS-3" = {
				box_height = 70.0;
				box_width = 400.0;
				cx = 960.0;
				cy = 961.0;
				output = "HEADLESS-3";
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					input_opacity = 1.0;
					input_radius = 6.0;
					show_login_button = true;
				};
			};
			"lockscreen-login-box@eDP-1" = {
				box_height = 70.0;
				box_width = 400.0;
				cx = 960.0;
				cy = 1081.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					input_opacity = 1.0;
					input_radius = 6.0;
					show_login_button = true;
				};
			};
			"lockscreen-login-box@sunshine" = {
				box_height = 70.0;
				box_width = 400.0;
				cx = 640.0;
				cy = 681.0;
				output = "sunshine";
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					input_opacity = 1.0;
					input_radius = 6.0;
					show_login_button = true;
				};
			};
			lockscreen-widget-0000000000000001 = {
				box_height = 240.0;
				box_width = 496.0;
				cx = 1720.0;
				cy = 584.0;
				output = "DP-3";
				rotation = 0.0;
				type = "clock";
			};
			lockscreen-widget-0000000000000002 = {
				box_height = 160.0;
				box_width = 368.0;
				cx = 1720.0;
				cy = 816.0;
				output = "DP-3";
				rotation = 0.0;
				type = "media_player";
			};
			lockscreen-widget-0000000000000003 = {
				box_height = 304.0;
				box_width = 768.0;
				cx = 960.0;
				cy = 212.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "clock";
			};
			lockscreen-widget-0000000000000004 = {
				box_height = 176.0;
				box_width = 400.0;
				cx = 960.0;
				cy = 484.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "media_player";
				settings = {
					background_opacity = 0.75;
					hide_when_no_media = false;
					layout = "horizontal";
				};
			};
			lockscreen-widget-0000000000000005 = {
				box_height = 192.0;
				box_width = 400.0;
				cx = 960.0;
				cy = 484.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "fancy_audio_visualizer";
				settings = {
					background = false;
					visualization_mode = "wave_rings";
				};
			};
			lockscreen-widget-0000000000000006 = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 816.0;
				cy = 1020.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "sysmon";
				settings = {
					display = "gauge";
					stat = "net_rx";
					stat2 = "cpu_temp";
				};
			};
			lockscreen-widget-0000000000000007 = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 1040.0;
				cy = 1020.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "sysmon";
				settings = {
					display = "gauge";
					stat = "ram_pct";
					stat2 = "";
				};
			};
			lockscreen-widget-0000000000000008 = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 1125.5;
				cy = 1020.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "sysmon";
				settings = {
					display = "gauge";
					gauge_layout = "horizontal";
					stat = "cpu_usage";
					stat2 = "cpu_temp";
				};
			};
			lockscreen-widget-0000000000000009 = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 936.5;
				cy = 1020.0;
				output = "HDMI-A-1";
				rotation = 0.0;
				type = "sysmon";
				settings = {
					display = "gauge";
					stat = "net_tx";
					stat2 = "cpu_temp";
				};
			};
			lockscreen-widget-000000000000000a = {
				box_height = 272.0;
				box_width = 528.0;
				cx = 328.0;
				cy = 160.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "clock";
			};
			lockscreen-widget-000000000000000b = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 960.0;
				cy = 910.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "media_player";
			};
			lockscreen-widget-000000000000000c = {
				box_height = 0.0;
				box_width = 0.0;
				cx = 1796.0;
				cy = 70.0;
				output = "eDP-1";
				rotation = 0.0;
				type = "weather";
			};
		};
	};
	nightlight = {
		enabled = true;
	};
	notification = {
		background_opacity = 0.29999999329447746;
		position = "top_center";
	};
	osd = {
		background_opacity = 0.29999999329447746;
		monitors = [  ];
		position_vertical = "center_right";
		scale = 1.15;
	};
	plugins = {
		enabled = [ "noctalia/wallhaven" ];
	};
	shell = {
		app_icon_color = "secondary";
		avatar_path = "/home/gambled/Pictures/face.jpg";
		corner_radius_scale = 1.100000016391277;
		font_family = "DejaVu Sans";
		launch_apps_as_systemd_services = true;
		password_style = "random";
		polkit_agent = true;
		screen_time_enabled = true;
		settings_show_advanced = true;
		ui_scale = 1.0000000074505806;
		animation = {
			speed = 1.2500000186264515;
		};
		panel = {
			shadow = false;
			transparency_mode = "soft";
		};
		session = {
			actions = [ {
				action = "command";
				command = "nix-rbd";
				countdown_seconds = 0.0;
				enabled = true;
				glyph = "snowflake";
				label = "Rebuild";
				shortcut = "1";
				variant = "secondary";
			} {
				action = "lock";
				countdown_seconds = 0.0;
				enabled = true;
				shortcut = "2";
				variant = "default";
			} {
				action = "lock_and_suspend";
				countdown_seconds = 5.0;
				enabled = true;
				shortcut = "3";
				variant = "default";
			} {
				action = "reboot";
				countdown_seconds = 5.0;
				enabled = true;
				shortcut = "4";
				variant = "default";
			} {
				action = "logout";
				countdown_seconds = 0.0;
				enabled = true;
				shortcut = "5";
				variant = "default";
			} {
				action = "shutdown";
				countdown_seconds = 5.0;
				enabled = true;
				shortcut = "6";
				variant = "destructive";
			} ];
		};
		shadow = {
			alpha = 0.0;
		};
	};
	theme = {
		builtin = "Catppuccin";
		community_palette = "Oxocarbon";
		mode = "dark";
		source = "wallpaper";
		wallpaper_scheme = "m3-content";
		templates = {
			builtin_ids = [ "btop" "gtk3" "gtk4" "ghostty" "hyprland" "mango" "qt" "starship" ];
			community_ids = [ "spicetify" "neovim" "vscode" "vicinae" "discord" "steam" "yazi" "hyprtoolkit" ];
			user = {
				antigravity-ide = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/spicetify.ini";
					output_path = "$XDG_CONFIG_HOME/noctalia/templates/ignore";
					post_hook = "cp ~/.vscode/extensions/noctalia.noctaliatheme-*/themes/NoctaliaTheme-color-theme.json ~/.antigravity-ide/extensions/noctalia.noctaliatheme-*/themes/NoctaliaTheme-color-theme.json";
				};
				lazygit = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/lazygit.yml";
					output_path = "$XDG_CONFIG_HOME/lazygit/config.yml";
					post_hook = "";
				};
				spicetify-nix = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/spicetify.ini";
					output_path = "/etc/nixos/Features/Ricing/noctalia_colors/spicetify.ini";
					post_hook = "";
				};
				starship = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/starship.toml";
					output_path = "$XDG_CONFIG_HOME/noctalia/templates/ignore";
					post_hook = "cp ~/.cache/noctalia/starship-palette.toml /etc/nixos/Features/Ricing/noctalia_colors/starship.toml";
				};
				siyuan = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/siyuan.css";
					output_path = "~/SiYuan/conf/appearance/themes/Noctalia/theme.css";
					post_hook = "";
				};
				nvf = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/nvf.nix";
					output_path = "/etc/nixos/Features/Ricing/noctalia_colors/nvf.nix";
					post_hook = "";
				};
			};
		};
	};
	wallpaper = {
		directory = "/home/gambled/Pictures/Wallpapers";
		enabled = true;
		per_monitor_directories = true;
		transition_on_startup = true;
		automation = {
			enabled = false;
			interval_seconds = 86400;
		};
		default = {
			path = "/home/gambled/Pictures/Wallpapers/Wide/pixelart/dock.jpg";
		};
		last = {
			path = "/home/gambled/Pictures/Wallpapers/Wide/pixelart/dock.jpg";
		};
		monitor = {
			DP-3 = {
				directory = "/home/gambled/Pictures/Wallpapers/Ultrawide";
			};
			HDMI-A-1 = {
				directory = "/home/gambled/Pictures/Wallpapers/Wide";
			};
			eDP-1 = {
				directory = "/home/gambled/Pictures/Wallpapers/Wide";
			};
		};
		monitors = {
			DP-3 = {
				path = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_qz87gl.jpg";
			};
			HDMI-A-1 = {
				path = "/home/gambled/Pictures/Wallpapers/Wide/pixelart/dock.jpg";
			};
			eDP-1 = {
				path = "/home/gambled/Pictures/Wallpapers/Wide/minimalistic/haz-mat.png";
			};
			sunshine = {
				path = "/home/gambled/Pictures/Wallpapers/Ultrawide/anime/wallhaven_1klxl3.jpg";
			};
		};
	};
	widget = {
		active_window = {
			max_length = 200;
			min_length = 0;
			title_scroll = "on_hover";
		};
		battery = {
			hide_when_full = true;
			hide_when_plugged = true;
		};
		control-center = {
			capsule = true;
			capsule_radius = 8;
		};
		media = {
			anchor = true;
			max_length = 800;
			min_length = 0;
			title_scroll = "on_hover";
		};
		privacy = {
			hide_inactive = true;
		};
		temp = {
			stat = "ram_pct";
		};
		tray = {
			capsule = true;
			drawer = true;
		};
		vicinae = {
			capsule = true;
			capsule_padding = 3.0;
			command = "vicinae toggle";
			glyph = "rocket";
			right_command = "vicinae toggle";
			type = "custom_button";
		};
		volume = {
			capsule = true;
			scroll_step = 1;
		};
		workspaces = {
			capsule = true;
			empty_color = "tertiary";
			minimal = true;
		};
	};
};

in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    
    settings = noctalia_settings;
  };

  home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
    text = builtins.toJSON {
      defaultWallpaper = "/etc/nixos/wallpaper.jpg";
      wallpapers = {
        "DP-3" = "/home/gambled/Pictures/Wallpapers/Ultrawide/abstract/wallhaven_lyql6p.jpg";
        "sunshine" = "/home/gambled/Pictures/Wallpapers/Wide/irl/ferns-green.jpg";
        "HDMI-A-1" = "/home/gambled/Pictures/Wallpapers/Wide/vibrant/wallhaven_yj96lx.jpg";
        "eDP-1" = "/home/gambled/Pictures/Wallpapers/Wide/vibrant/wallhaven_yj96lx.jpg";
      };
    };
  };

  home.file.".config/noctalia/templates/spicetify.ini".text = ''
    text               = {{colors.on_surface.default.hex_stripped}}
    subtext            = {{colors.on_surface_variant.default.hex_stripped}}
    main               = {{colors.surface.default.hex_stripped}}
    main-elevated      = {{colors.surface.default.hex_stripped}}
    main-transition    = {{colors.surface_container_lowest.default.hex_stripped}}
    highlight          = {{colors.surface_container_low.default.hex_stripped}}
    highlight-elevated = {{colors.surface_container_highest.default.hex_stripped}}
    sidebar            = {{colors.surface.default.hex_stripped}}
    player             = {{colors.surface.default.hex_stripped}}
    card               = {{colors.surface.default.hex_stripped}}
    shadow             = {{colors.surface.default.hex_stripped}}
    selected-row       = {{colors.on_surface.default.hex_stripped}}
    button             = {{colors.primary.default.hex_stripped}}
    button-active      = {{colors.primary.default.hex_stripped}}
    button-disabled    = {{colors.primary.default.hex_stripped}}
    tab-active         = {{colors.surface.default.hex_stripped}}
    notification       = {{colors.tertiary.default.hex_stripped}}
    notification-error = {{colors.error.default.hex_stripped}}
    misc               = {{colors.surface.default.hex_stripped}}
    play-button        = {{colors.secondary.default.hex_stripped}}
    play-button-active = {{colors.secondary.default.hex_stripped}}
    progress-fg        = {{colors.primary.default.hex_stripped}}
    progress-bg        = {{colors.surface.default.hex_stripped}}
    heart              = {{colors.error.default.hex_stripped}}
    pagelink-active    = {{colors.on_tertiary_container.default.hex_stripped}}
    radio-btn-active   = {{colors.on_tertiary_container.default.hex_stripped}}
  '';

  home.file.".config/noctalia/templates/nvf.nix".text = ''
    {
      base00 = "{{colors.surface.default.hex}}";
      base01 = "{{colors.surface_container.default.hex}}";
      base02 = "{{colors.surface_container_high.default.hex}}";
      base03 = "{{colors.outline.default.hex}}";
      base04 = "{{colors.on_surface_variant.default.hex}}";
      base05 = "{{colors.on_surface.default.hex}}";
      base06 = "{{colors.on_surface.default.hex}}";
      base07 = "{{colors.on_background.default.hex}}";
      base08 = "{{colors.error.default.hex}}";
      base09 = "{{colors.tertiary.default.hex}}";
      base0A = "{{colors.secondary.default.hex}}";
      base0B = "{{colors.primary.default.hex}}";
      base0C = "{{colors.tertiary_fixed_dim.default.hex}}";
      base0D = "{{colors.primary_fixed_dim.default.hex}}";
      base0E = "{{colors.secondary_fixed_dim.default.hex}}";
      base0F = "{{colors.error_container.default.hex}}";
    }
  '';

  home.file.".config/noctalia/templates/lazygit.yml".text = ''
gui:
  theme:
    activeBorderColor:
      - "{{colors.primary.default.hex}}"
      - bold
    inactiveBorderColor:
      - "{{colors.secondary.default.hex}}"
    searchingActiveBorderColor:
      - "{{colors.tertiary.default.hex}}"
      - bold
    optionsTextColor:
      - "{{colors.on_surface_variant.default.hex}}"
    selectedLineBgColor:
      - "{{colors.on_surface_variant.default.hex}}"
    inactiveViewSelectedLineBgColor:
      - bold
    cherryPickedCommitFgColor:
      - "{{colors.on_surface_variant.default.hex}}"
    cherryPickedCommitBgColor:
      - "{{colors.tertiary.default.hex}}"
    markedBaseCommitFgColor:
      - "{{colors.tertiary.default.hex}}"
    markedBaseCommitBgColor:
      - "{{colors.error.default.hex}}"
    unstagedChangesColor:
      - "{{colors.error.default.hex}}"
    defaultFgColor:
      - "{{colors.on_surface.default.hex}}"
  '';

  home.packages = with pkgs; [
    # For screenshotting and screen recording plugins
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    ffmpeg
    jq
    wl-screenrec
    adw-gtk3 # custom color theme so gtk can use noctalia colors
    qt6.qtwebsockets 
  ];

  home.file.".config/noctalia/templates/siyuan.css".text = ''
:root[data-theme-mode="light"] {
    /* 主色 */
    --b3-theme-primary: {{colors.primary.light.hex}};
    --b3-theme-primary-light: {{ colors.primary.light.rgba | set_alpha 0.54 }};
    --b3-theme-primary-lighter: {{ colors.primary.light.rgba | set_alpha 0.38 }};
    --b3-theme-primary-lightest: {{ colors.primary.light.rgba | set_alpha 0.12 }};
    --b3-theme-secondary: {{colors.secondary.light.hex}};
    --b3-theme-background: {{colors.background.light.hex}};
    --b3-theme-background-light: {{colors.background.light.rgba | set_alpha 0.54}};
    --b3-theme-surface: {{colors.surface.light.hex}};
    --b3-theme-surface-light: {{colors.surface.light.rgba | set_alpha 0.54}};
    --b3-theme-surface-lighter: {{colors.surface.light.rgba | set_alpha 0.38}};
    --b3-theme-error: {{colors.error.light.hex}};
    --b3-theme-success: #3dc200;

    /* 文字颜色 */
    --b3-theme-on-primary: {{colors.on_primary.light.hex}};
    --b3-theme-on-secondary: {{colors.on_secondary.light.hex}};
    --b3-theme-on-background: {{colors.on_background.light.hex}};
    --b3-theme-on-surface: {{colors.on_surface.light.hex}};
    --b3-theme-on-surface-light: {{colors.on_surface.light.rgba | set_alpha 0.68 }};
    --b3-theme-on-error: {{colors.on_error.light.hex}};

    /* 字体 */
    /* "Segoe UI" 和 Noto-COLRv1-2.047 冲突，故移除 */
    --b3-font-family: "Emojis Additional", "Emojis Reset", BlinkMacSystemFont, Helvetica, "Luxi Sans", "DejaVu Sans", arial, sans-serif, emojis;
    --b3-font-family-protyle: var(--b3-font-family);
    --b3-font-family-code: "Emojis Additional", "Emojis Reset", "JetBrainsMono-Regular", mononoki, Consolas, "Liberation Mono", var(--b3-font-family);
    --b3-font-family-graph: arial;
    --b3-font-family-emoji: "Emojis Additional", emojis;
    --b3-font-family-math: KaTeX_Math;
    --b3-font-family-kbd: var(--b3-font-family-protyle);
    --b3-font-size: 14px;

    /* 顶部工具栏 */
    --b3-toolbar-background: var(--b3-theme-surface);
    --b3-toolbar-blur-background: #fcfcfc;
    --b3-toolbar-color: var(--b3-theme-on-surface);
    --b3-toolbar-hover: var(--b3-theme-background-light);
    --b3-toolbar-left-mac: 74px;

    /* 线条 */
    --b3-border-color: var(--b3-theme-surface-lighter);
    --b3-border-radius: 6px;
    --b3-border-radius-s: 3px;
    --b3-border-radius-b: 12px;

    /* 滚动条 */
    --b3-scroll-color: rgba(0, 0, 0, .2);

    /* 列表 */
    --b3-list-hover: rgba(0, 0, 0, .075);
    --b3-list-icon-hover: rgba(33, 34, 36, .1);

    /* 菜单 */
    --b3-menu-background: var(--b3-theme-surface);

    /* 提示 */
    --b3-tooltips-background: #312f35;
    --b3-tooltips-color: var(--b3-theme-background-light);
    --b3-tooltips-second-color: #7d7c7a;
    --b3-tooltips-shadow: 0 2px 8px rgba(0, 0, 0, .1);

    /* 为空提示 */
    --b3-empty-color: var(--b3-theme-on-surface-light);

    /* 遮罩 */
    --b3-mask-background: rgba(220, 220, 220, .4);

    /* 卡片背景 */
    --b3-card-error-color: {{colors.on_error_container.light.hex}};
    --b3-card-error-background: {{colors.error_container.light.hex}};
    --b3-card-warning-color: #b16700;
    --b3-card-warning-background: #ffe8c8;
    --b3-card-info-color: #005599;
    --b3-card-info-background: #d6eaf9;
    --b3-card-success-color: #008606;
    --b3-card-success-background: #d7eed8;

    /* 自定义文字 */
    --b3-font-color1: var(--b3-card-error-color);
    --b3-font-color2: var(--b3-card-warning-color);
    --b3-font-color3: var(--b3-card-info-color);
    --b3-font-color4: var(--b3-card-success-color);
    --b3-font-color5: var(--b3-theme-on-surface);
    --b3-font-color6: var(--b3-theme-primary);
    --b3-font-color7: var(--b3-theme-secondary);
    --b3-font-color8: var(--b3-theme-error);
    --b3-font-color9: #f5539e;
    --b3-font-color10: #00cdcd;
    --b3-font-color11: #00b853;
    --b3-font-color12: #9e9700;
    --b3-font-color13: var(--b3-theme-background);
    --b3-font-background1: var(--b3-card-error-background);
    --b3-font-background2: var(--b3-card-warning-background);
    --b3-font-background3: var(--b3-card-info-background);
    --b3-font-background4: var(--b3-card-success-background);
    --b3-font-background5: #e2e3e4;
    --b3-font-background6: #acd0fc;
    --b3-font-background7: #fddaab;
    --b3-font-background8: #ffb0a9;
    --b3-font-background9: #fdbfff;
    --b3-font-background10: #b1ffff;
    --b3-font-background11: #affad1;
    --b3-font-background12: #fff88f;
    --b3-font-background13: var(--b3-theme-on-background);

    /* 动画效果 */
    --b3-transition: all .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-width-transition: width .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-color-transition: color .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-background-transition: background 20ms ease-in 0s;

    /* 高亮 */
    --b3-highlight-color: #222;
    --b3-highlight-background: #ffff00;
    --b3-highlight-current-background: #ff9632;

    /* 下拉菜单 */
    --b3-select-background: url("data:image/svg+xml;utf8,<svg fill='rgba(95, 99, 104, .68)' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>") no-repeat right 2px center var(--b3-theme-background);

    /* switch */
    --b3-switch-background: #e1e3e1;
    --b3-switch-border: var(--b3-theme-on-surface-light);
    --b3-switch-hover: rgba(31, 31, 31, 0.06);
    --b3-switch-checked: #fff;
    --b3-switch-checked-background: var(--b3-theme-primary);
    --b3-switch-checked-hover: #d3e3fd;
    --b3-switch-checked-hover2: rgba(31, 31, 31, .06);

    /* 阴影 */
    --b3-point-shadow: 0 0 1px 0 rgba(0, 0, 0, .1), 0 0 2px 0 rgba(0, 0, 0, .2);
    --b3-dialog-shadow: 0 8px 24px rgba(0, 0, 0, .2);
    --b3-button-shadow: 0 1px 2px 0 rgb(0 0 0 / .3), 0 1px 3px 1px rgb(0 0 0 /.15);
    --b3-button-active-shadow: 0 2px 3px 1px rgb(0 0 0 / .3), 0 2px 4px 2px rgb(0 0 0 /.15);

    /* 图表颜色 */
    --b3-graph-p-point: #076f7e;
    --b3-graph-heading-point: #8250df;
    --b3-graph-math-point: #80FFA5;
    --b3-graph-code-point: #00DDFF;
    --b3-graph-table-point: #37A2FF;
    --b3-graph-list-point: #FF0087;
    --b3-graph-todo-point: #FFBF00;
    --b3-graph-olist-point: #b3005f;
    --b3-graph-listitem-point: #f65b00;
    --b3-graph-bq-point: #8d48e3;
    --b3-graph-callout-point: var(--b3-theme-success);
    --b3-graph-super-point: #dd79ff;
    --b3-graph-doc-point: #202124;
    --b3-graph-tag-point: #dbf32f;
    --b3-graph-asset-point: #05c091;
    --b3-graph-line: #5f6368;
    --b3-graph-ref-line: #d23f31;
    --b3-graph-tag-line: #5f6b06;
    --b3-graph-tag-tag-line: #dbf32f;
    --b3-graph-asset-line: #037457;
    --b3-graph-hl-point: #f3a92f;
    --b3-graph-hl-line: {{colors.primary.light.hex}};

    /* 代码片段背景 */
    --b3-protyle-code-background: rgba(27, 31, 35, .05);

    /* 所见即所得行内元素颜色 */
    --b3-protyle-inline-strong-color: inherit;
    --b3-protyle-inline-em-color: inherit;
    --b3-protyle-inline-u-color: inherit;
    --b3-protyle-inline-s-color: inherit;
    --b3-protyle-inline-link-color: {{colors.primary.light.hex}};
    --b3-protyle-inline-mark-background: rgb(252, 212, 126);
    --b3-protyle-inline-mark-color: #202124;
    --b3-protyle-inline-tag-color: #5f6368;
    --b3-protyle-inline-blockref-color: #8957e5;
    --b3-protyle-inline-fileref-color: #21862e;

    /* PDF */
    --b3-pdf-selection: #d0e9c8;
    --sidebar-width: 200px;
    --b3-pdf-offset: 0;
    --b3-pdf-background1: var(--b3-theme-error);
    --b3-pdf-background2: #f5822e;
    --b3-pdf-background3: #FACA5A;
    --b3-pdf-background4: #7CC868;
    --b3-pdf-background5: #FC5C88;
    --b3-pdf-background6: #69B0F2;
    --b3-pdf-background7: #C885DA;
    --b3-pdf-dark: #212224;

    /* callout */
    --b3-callout-note: var(--b3-theme-primary);
    --b3-callout-tip: var(--b3-theme-success);
    --b3-callout-caution: var(--b3-theme-error);
    --b3-callout-important: var(--b3-protyle-inline-blockref-color);
    --b3-callout-warning: var(--b3-highlight-current-background);

    /* 表格 */
    --b3-table-even-background: rgba(0, 0, 0, .02);

    /* 数据库 */
    --b3-av-gallery-shadow: rgba(0, 0, 0, 0.04) 0px 2px 4px 0px, var(--b3-border-color) 0px 0px 0px 1px;

    /* 嵌入块 */
    --b3-embed-background: transparent;

    /* 引述块 */
    --b3-bq-background: transparent;

    /* 父块颜色 */
    --b3-parent-background: var(--b3-theme-background);

    /* https://github.com/siyuan-note/siyuan/issues/6440 */
    .protyle-action--order::after {
        mix-blend-mode: multiply;
    }

    .b3-typography .code-block, .protyle-wysiwyg .code-block {
        background-color: rgba(27, 31, 35, .05);
    }
}

:root[data-theme-mode="dark"] {
    /* 主色 */
    --b3-theme-primary: {{colors.primary.dark.hex}};
    --b3-theme-primary-light: {{ colors.primary.dark.rgba | set_alpha 0.54 }};
    --b3-theme-primary-lighter: {{ colors.primary.dark.rgba | set_alpha 0.38 }};
    --b3-theme-primary-lightest: {{ colors.primary.dark.rgba | set_alpha 0.12 }};
    --b3-theme-secondary: {{colors.secondary.dark.hex}};
    --b3-theme-background: {{colors.background.dark.hex}};
    --b3-theme-background-light: {{colors.background.dark.rgba | set_alpha 0.54}};
    --b3-theme-surface: {{colors.surface.dark.hex}};
    --b3-theme-surface-light: {{colors.surface.dark.rgba | set_alpha 0.54}};
    --b3-theme-surface-lighter: {{colors.surface.dark.rgba | set_alpha 0.38}};
    --b3-theme-error: {{colors.error.dark.hex}};
    --b3-theme-success: #65b84d;

    /* 文字颜色 */
    --b3-theme-on-primary: {{colors.on_primary.dark.hex}};
    --b3-theme-on-secondary: {{colors.on_secondary.dark.hex}};
    --b3-theme-on-background: {{colors.on_background.dark.hex}};
    --b3-theme-on-surface: {{colors.on_surface.dark.hex}};
    --b3-theme-on-surface-light: {{colors.on_surface.dark.rgba | set_alpha 0.68 }};
    --b3-theme-on-error: {{colors.on_error.dark.hex}};

    /* 字体 */
    --b3-font-family: "Emojis Additional", "Emojis Reset", BlinkMacSystemFont, Helvetica, "Luxi Sans", "DejaVu Sans", arial, sans-serif, emojis;
    --b3-font-family-protyle: var(--b3-font-family);
    --b3-font-family-code: "Emojis Additional", "Emojis Reset", "JetBrainsMono-Regular", mononoki, Consolas, "Liberation Mono", var(--b3-font-family);
    --b3-font-family-graph: arial;
    --b3-font-family-emoji: "Emojis Additional", emojis;
    --b3-font-family-math: KaTeX_Math;
    --b3-font-family-kbd: var(--b3-font-family-protyle);
    --b3-font-size: 14px;

    /* 顶部工具栏 */
    --b3-toolbar-background: var(--b3-theme-surface);
    --b3-toolbar-blur-background: var(--b3-border-color);
    --b3-toolbar-color: var(--b3-theme-on-surface);
    --b3-toolbar-hover: var(--b3-theme-background-light);
    --b3-toolbar-left-mac: 74px;

    /* 线条 */
    --b3-border-color: #363636;
    --b3-border-radius: 6px;
    --b3-border-radius-s: 3px;
    --b3-border-radius-b: 12px;

    /* 滚动条 */
    --b3-scroll-color: rgba(230, 230, 230, .2);

    /* 列表 */
    --b3-list-hover: rgba(255, 255, 255, .075);
    --b3-list-icon-hover: rgba(201, 209, 217, .1);

    /* 菜单 */
    --b3-menu-background: var(--b3-theme-surface);

    /* 提示 */
    --b3-tooltips-background: #030303;
    --b3-tooltips-color: var(--b3-theme-on-surface-light);
    --b3-tooltips-second-color: #7d7c7a;
    --b3-tooltips-shadow: 0 2px 8px rgba(0, 0, 0, .3);

    /* 为空提示 */
    --b3-empty-color: var(--b3-theme-on-surface);

    /* 遮罩 */
    --b3-mask-background: rgba(10, 10, 10, .4);

    /* 卡片背景 */
    --b3-card-error-color: {{colors.on_error_container.dark.hex}};
    --b3-card-error-background: {{colors.error_container.dark.hex}};
    --b3-card-warning-color: rgb(255, 213, 153);
    --b3-card-warning-background: #554636;
    --b3-card-info-color: rgb(166, 213, 250);
    --b3-card-info-background: #28405c;
    --b3-card-success-color: rgb(183, 223, 185);
    --b3-card-success-background: #425347;

    /* 自定义文字 */
    --b3-font-color1: var(--b3-card-error-color);
    --b3-font-color2: var(--b3-card-warning-color);
    --b3-font-color3: var(--b3-card-info-color);
    --b3-font-color4: var(--b3-card-success-color);
    --b3-font-color5: var(--b3-theme-on-surface);
    --b3-font-color6: var(--b3-theme-primary);
    --b3-font-color7: var(--b3-theme-secondary);
    --b3-font-color8: var(--b3-theme-error);
    --b3-font-color9: #f5539e;
    --b3-font-color10: #00eeff;
    --b3-font-color11: #74ff00;
    --b3-font-color12: #fff200;
    --b3-font-color13: var(--b3-theme-background);
    --b3-font-background1: var(--b3-card-error-background);
    --b3-font-background2: var(--b3-card-warning-background);
    --b3-font-background3: var(--b3-card-info-background);
    --b3-font-background4: var(--b3-card-success-background);
    --b3-font-background5: #4c5257;
    --b3-font-background6: #08296c;
    --b3-font-background7: #593905;
    --b3-font-background8: #541812;
    --b3-font-background9: #843473;
    --b3-font-background10: #329096;
    --b3-font-background11: #568b2a;
    --b3-font-background12: #8d8829;
    --b3-font-background13: var(--b3-theme-on-background);

    /* 动画效果 */
    --b3-transition: all .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-width-transition: width .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-color-transition: color .2s cubic-bezier(0, 0, .2, 1) 0ms;
    --b3-background-transition: background 20ms ease-in 0s;

    /* 高亮 */
    --b3-highlight-color: #222;
    --b3-highlight-background: #ffff00;
    --b3-highlight-current-background: #ff9632;

    /* 下拉菜单 */
    --b3-select-background: url("data:image/svg+xml;utf8,<svg fill='rgba(154, 160, 166, .68)' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>") no-repeat right 2px center var(--b3-theme-background);

    /* switch */
    --b3-switch-background: #444746;
    --b3-switch-border: var(--b3-theme-on-surface-light);
    --b3-switch-hover: rgba(253, 252, 251, .10);
    --b3-switch-checked: var(--b3-theme-primary);
    --b3-switch-checked-background: #a8c7fa;
    --b3-switch-checked-hover: var(--b3-theme-primary);
    --b3-switch-checked-hover2: rgba(253, 252, 251, .10);

    /* 阴影 */
    --b3-point-shadow: inset 0 .5px .5px .5px rgba(255, 255, 255, .09), 0 3px 6px rgba(0, 0, 0, .04), 0 0 0 0 transparent;
    --b3-dialog-shadow: 0 8px 24px #010409;
    --b3-button-shadow: 0 1px 2px 0 rgb(0 0 0 / .3), 0 1px 3px 1px rgb(255 255 255 /.15);
    --b3-button-active-shadow: 0 2px 3px 1px rgb(0 0 0 / .3), 0 2px 4px 2px rgb(255 255 255 /.15);

    /* 图表颜色 */
    --b3-graph-p-point: #076f7e;
    --b3-graph-heading-point: hsl(254, 80%, 74.8%);
    --b3-graph-math-point: #80FFA5;
    --b3-graph-code-point: #00DDFF;
    --b3-graph-table-point: #37A2FF;
    --b3-graph-list-point: #FF0087;
    --b3-graph-todo-point: #FFBF00;
    --b3-graph-olist-point: #b3005f;
    --b3-graph-listitem-point: #f65b00;
    --b3-graph-bq-point: #8d48e3;
    --b3-graph-callout-point: var(--b3-theme-success);
    --b3-graph-super-point: #dd79ff;
    --b3-graph-doc-point: #e8eaed;
    --b3-graph-tag-point: #dbf32f;
    --b3-graph-asset-point: #05c091;
    --b3-graph-line: #9aa0a6;
    --b3-graph-ref-line: #d23f31;
    --b3-graph-tag-line: #5f6b06;
    --b3-graph-tag-tag-line: #dbf32f;
    --b3-graph-asset-line: #037457;
    --b3-graph-hl-point: #f3a92f;
    --b3-graph-hl-line: #4285f4;

    /* 代码片段背景 */
    --b3-protyle-code-background: rgba(240, 246, 252, .15);

    /* 所见即所得行内元素颜色 */
    --b3-protyle-inline-strong-color: inherit;
    --b3-protyle-inline-em-color: inherit;
    --b3-protyle-inline-u-color: inherit;
    --b3-protyle-inline-s-color: inherit;
    --b3-protyle-inline-link-color: #8ab4f8;
    --b3-protyle-inline-mark-background: #b29100;
    --b3-protyle-inline-mark-color: var(--b3-theme-on-background);
    --b3-protyle-inline-tag-color: #9aa0a6;
    --b3-protyle-inline-blockref-color: #8957e5;
    --b3-protyle-inline-fileref-color: var(--b3-theme-secondary);

    /* PDF */
    --b3-pdf-selection: #779170;
    --sidebar-width: 200px;
    --b3-pdf-offset: 0;
    --b3-pdf-background1: var(--b3-theme-error);
    --b3-pdf-background2: #f5822e;
    --b3-pdf-background3: #FACA5A;
    --b3-pdf-background4: #7CC868;
    --b3-pdf-background5: #FC5C88;
    --b3-pdf-background6: #69B0F2;
    --b3-pdf-background7: #C885DA;
    --b3-pdf-dark: #212224;

    /* callout */
    --b3-callout-note: var(--b3-theme-primary);
    --b3-callout-tip: var(--b3-theme-success);
    --b3-callout-caution: var(--b3-theme-error);
    --b3-callout-important: var(--b3-protyle-inline-blockref-color);
    --b3-callout-warning: var(--b3-highlight-current-background);

    /* 表格 */
    --b3-table-even-background: rgba(255, 255, 255, .03);

    /* 数据库 */
    --b3-av-gallery-shadow: rgba(0, 0, 0, 0.04) 0px 2px 4px 0px, var(--b3-border-color) 0px 0px 0px 1px;

    /* 嵌入块 */
    --b3-embed-background: transparent;

    /* 引述块 */
    --b3-bq-background: transparent;

    /* 父块颜色 */
    --b3-parent-background: var(--b3-theme-background);


    /* https://github.com/siyuan-note/siyuan/issues/6440 */
    .protyle-action--order::after {
        mix-blend-mode: screen;
    }

    .b3-text-field::-webkit-calendar-picker-indicator {
        filter: invert(1)
    }
}

/* 微软字体斜体会被相邻背景遮挡，将 arial 放置其前 https://github.com/siyuan-note/siyuan/issues/11841 */
:root:lang(zh_CN) {
    --b3-font-family: "Emojis Additional", "Emojis Reset", BlinkMacSystemFont, Helvetica, "PingFang SC", "Luxi Sans", "DejaVu Sans", arial, "Microsoft Yahei", "Hiragino Sans GB", "Source Han Sans SC", sans-serif, emojis;
}

:root:lang(zh_CHT) {
    --b3-font-family: "Emojis Additional", "Emojis Reset", BlinkMacSystemFont, Helvetica, "PingFang TC", "Luxi Sans", "DejaVu Sans", arial, "Microsoft JhengHei", "Hiragino Sans TC", "Source Han Sans TC", sans-serif, emojis;
}

:root:lang(ja_JP) {
    --b3-font-family: "Emojis Additional", "Emojis Reset", BlinkMacSystemFont, Helvetica, "Luxi Sans", "DejaVu Sans", "Yu Gothic UI", arial, sans-serif, emojis;
}
  '';
}
