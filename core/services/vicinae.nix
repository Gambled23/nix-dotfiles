{ lib, inputs, config, pkgs, ... }: 

{
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      font = {
        size = 10.5;
      };
      search_files_in_root = true;
      theme = {
        light = {
          name = lib.mkForce "gruvbox-light";
          icon_theme = "default";
        };
        dark = {
          name = lib.mkForce "gruvbox-dark";
          icon_theme = "default";
        };
      };
      window = {
        csd = true;
        rounding = 10;
      };
      launcher_window = {
        opacity = lib.mkForce 0.6;
      };
    };

    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      # bluetooth
      # chromium-extensions
      nix
      hypr-keybinds
      process-manager
    ];
  };
}