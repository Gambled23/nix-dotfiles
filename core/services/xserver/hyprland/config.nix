# Home manager file
{
  inputs,
  pkgs,
  lib,
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
    ../../../programs/noctalia.nix
    ../../../programs/yazi.nix
    ../../hypr/hyprlock.nix
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
      inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".borders-plus-plus
      inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".hyprscrolling
      # inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".csgo-vulkan-fix
    ];

    settings = {
      ###################
      ### MY PROGRAMS ###
      ###################
      "$terminal" = "uwsm app -- konsole";
      "$fileManager" = "konsole -e yazi";
      "$web_browser" = "uwsm app -- google-chrome-stable";
      "$code" = "uwsm app -- code";
      "$menu" = "uwsm app -- vicinae toggle";
      "$mainMod" = "SUPER";


      #################
      ### AUTOSTART ###
      #################
      "exec-once" = [
        # "systemctl --user enable --now hyprpolkitagent.service"
        "systemctl --user enable --now hyprpaper.service"
        "systemctl --user enable --now hypridle.service"
        "uwsm app -- spotify %U"
        "uwsm app -- vesktop %U"
        "uwsm app -- altus %U"
        "uwsm app -- kdeconnect-indicator %U"
        "konsole -e noctalia-shell -d"
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
  };

}