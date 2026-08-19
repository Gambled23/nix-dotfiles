{ self, inputs, ... }: {
  flake.homeModules.quickshell = { ... }: let
    configuraciones = builtins.path {
      path = ./_configs;
      name = "myshell";
    };
  in {
    programs.quickshell = {
      enable = true;
      configs.shell = configuraciones;
      activeConfig = configuraciones;
      systemd.enable = true;
    };
  };
}
