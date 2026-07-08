{...}:{
  programs.noctalia.settings = {
		shell = {
			app_icon_color = "secondary";
			app_icon_colorize = false;
			avatar_path = "/home/gambled/Pictures/face.jpg";
			clipboard_auto_paste = "auto";
			clipboard_confirm_clear_history = true;
			clipboard_enabled = true;
			clipboard_history_max_entries = 100;
			clipboard_image_action_command = "";
			corner_radius_scale = 1.100000023841858;
			date_format = "%A, %x";
			disable_mipmaps = false;
			external_ip_enabled = false;
			font_family = "DejaVu Sans";
			launch_apps_as_systemd_services = true;
			launch_apps_custom_command = "";
			middle_click_opens_widget_settings = true;
			niri_overview_type_to_launch_enabled = false;
			offline_mode = false;
			password_style = "random";
			polkit_agent = true;
			screen_time_enabled = true;
			settings_show_advanced = true;
			setup_wizard_enabled = true;
			shared_gl_context = true;
			show_location = true;
			telemetry_enabled = false;
			time_format = "{:%H:%M}";
			ui_scale = 1.0;
			animation = {
				enabled = true;
				speed = 1.25;
			};
			greeter_sync = {
				auto_sync = false;
			};
			launcher = {
				app_grid = false;
				categories = true;
				compact = false;
				session_search = false;
				show_icons = true;
				sort_by_usage = true;
				dmenu = {
					
				};
			};
			mpris = {
				blacklist = [  ];
			};
			panel = {
				borders = true;
				clipboard_placement = "floating";
				clipboard_position = "center";
				control_center_placement = "attached";
				control_center_position = "auto";
				floating_offset = 8;
				launcher_placement = "floating";
				launcher_position = "center";
				open_near_click_clipboard = false;
				open_near_click_control_center = false;
				open_near_click_launcher = false;
				open_near_click_session = false;
				open_near_click_wallpaper = false;
				polkit_placement = "floating";
				polkit_position = "center";
				session_placement = "attached";
				session_position = "auto";
				shadow = false;
				transparency_mode = "soft";
				wallpaper_placement = "attached";
				wallpaper_position = "auto";
			};
			privacy = {
				cam_filter_regex = "";
				mic_filter_regex = "";
				screen_filter_regex = "";
			};
			screen_corners = {
				enabled = false;
				size = 32;
			};
			screenshot = {
				confirm_region = false;
				copy_to_clipboard = true;
				directory = "";
				filename_pattern = "";
				freeze_screen = true;
				pipe_command = "";
				pipe_to_command = false;
				save_to_file = true;
			};
			session = {
				power = {
					
				};
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
					command = "";
					countdown_seconds = 0.0;
					enabled = true;
					glyph = "";
					label = "";
					shortcut = "2";
					variant = "default";
				} {
					action = "lock_and_suspend";
					command = "";
					countdown_seconds = 5.0;
					enabled = true;
					glyph = "";
					label = "";
					shortcut = "3";
					variant = "default";
				} {
					action = "reboot";
					command = "";
					countdown_seconds = 5.0;
					enabled = true;
					glyph = "";
					label = "";
					shortcut = "4";
					variant = "default";
				} {
					action = "logout";
					command = "";
					countdown_seconds = 0.0;
					enabled = true;
					glyph = "";
					label = "";
					shortcut = "5";
					variant = "default";
				} {
					action = "shutdown";
					command = "";
					countdown_seconds = 5.0;
					enabled = true;
					glyph = "";
					label = "";
					shortcut = "6";
					variant = "destructive";
				} ];
			};
			shadow = {
				alpha = 0.0;
				direction = "down";
			};
		};
  };
}