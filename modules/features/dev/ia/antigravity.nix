{ self, inputs, ... }: {
  flake.homeModules.antigravity-cli = { pkgs, ... }: {
    programs.antigravity-cli = {
      enable = true;
      defaultModel = "gemini-3.5-flash";
      enableMcpIntegration = true;
      mutableSettings = true;
      permissions = {
        allow = [ "command(*)" ];
        deny = [ "command(rm -rf)" ];
        ask = [ "command(*)" ];
      };
      # commands = {
      #   changelog = {
      #     prompt =
      #       ''
      #       Your task is to parse the ``, ``, and `` from their input and use the `write_file` tool to correctly update the `CHANGELOG.md` file.
      #       '';
      #     description = "Adds a new entry to the project's CHANGELOG.md file.";
      #   };
      #   "git/fix" = { # Becomes /git:fix
      #     prompt = "Please analyze the staged git changes and provide a code fix for the issue described here: {{args}}.";
      #     description = "Generates a fix for a given GitHub issue.";
      #   };
      # };
      settings = {
        agentMode = "accept-edits";
        allowNonWorkspaceAccess = true;
        editorMode = "vim";
        notifications = true;
        toolPermission = "always-proceed";
        runningLightSpeed = "fast";
        verbosity = "low";
      };
      skills.m3e = "./skills/material-design-3-ui";
      skills.ml-best-practices = "./skills/ml-best-practices";
    };
  };
}
