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
				nvf = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/nvf.nix";
					output_path = "/etc/nixos/Features/Ricing/noctalia_colors/nvf.nix";
					post_hook = "nh os switch";
				};
				spicetify-nix = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/spicetify.ini";
					output_path = "/etc/nixos/Features/Ricing/noctalia_colors/spicetify.ini";
					post_hook = "nh os switch";
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
			enabled = true;
			interval_seconds = 86400;
		};
		default = {
			path = "/home/gambled/Pictures/Wallpapers/Wide/vibrant/firewatchguy.jpg";
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
    adw-gtk3 # custom color theme for gtk
    qt6.qtwebsockets 
  ];
}
