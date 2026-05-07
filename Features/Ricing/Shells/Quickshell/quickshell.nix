{ ... }:
let
  configuraciones = builtins.path {
    path = ./configs;
    name = "myshell";
  };
in
{
  programs.quickshell = {
    enable = true;

    # Expose the whole directory as one named config
    configs.shell = configuraciones;

    # Select that config by name
    activeConfig = configuraciones;

    systemd.enable = true;
  };
}