# Home manager file
{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: 
{
  imports = [
    # Services and programs
    ../../hypr/hyprsunset.nix
    ../../hypr/hyprpaper.nix
    ../../hypr/hypridle.nix
    ../../hypr/hyprshot.nix
    # ../../hypr/hyprpanel.nix
    # ../../../programs/ashell.nix
    # ../../../programs/noctalia.nix
    ../../hypr/hyprlock/cards.nix
    ../../vicinae.nix
    # ../../../programs/quickshell/quickshell.nix
    ./kitty.nix

    # Hyprland settings
    ./animations.nix
    ./binds.nix
    ./rules.nix
    ./input.nix
    ./look_and_feel.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    plugins = [
      # inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".borders-plus-plus
      # inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".hyprscrolling
      # inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".csgo-vulkan-fix
      # inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".hyprexpo
    ];

    settings = {
      ###################
      ### MY PROGRAMS ###
      ###################
      "$terminal" = "ghostty";
      "$fileManager" = "$terminal -e yazi";
      "$web_browser" = "google-chrome-stable";
      "$code" = "code";
      "$menu" = "vicinae toggle";
      "$mainMod" = "SUPER";


      #################
      ### AUTOSTART ###
      #################
      "exec-once" = [
        # "systemctl --user enable --now hyprpolkitagent.service"
        # "ghostty -e noctalia-shell -d"
        # "systemctl --user enable --now hyprpaper.service"
        "systemctl --user enable --now hypridle.service"
        "spotify"
        "discord"
        "altus"
        "kdeconnect-indicator"
        # "bluetoothctl connect 24:95:2F:60:BD:94"
      ];


      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      # See https://wiki.hypr.land/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];


      ###################
      ### PERMISSIONS ###
      ###################
      # See https://wiki.hypr.land/Configuring/Permissions/
      # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
      # for security reasons

      # ecosystem = {
      #   enforce_permissions = 1;
      # };

      permission = [
        "/usr/(bin|local/bin)/grim, screencopy, allow"
        "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow"
        "/usr/(bin|local/bin)/hyprpm, plugin, allow"
      ];
    };

    systemd.variables = ["--all"]; # To pass environment variables to the systemd services started by Hyprland
  };

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
}