{ self, inputs, ... }: {
  flake.homeModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_state"
          "$git_status"
          "$cmd_duration"
          "$python"
          "$line_break"
          "$character"
        ];
        palette = "noctalia";
      } // builtins.fromTOML (builtins.readFile ../shells/noctalia/_Colors/starship.toml);
      presets = [
        "bracketed-segments"
      ];
    };
  };
}
