{ self, inputs, pkgs, ... }: {
  flake.homeModules.antigravity-cli = { ... }: {
    programs.antigravity-cli = {
      enable = true;
      defaultModel = "gemini-3.5-flash";
      enableMcpIntegration = true;
      mutableSettings = true;
      package = inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli;
      permissions = {
        allow = [ "command(*)" ];
        deny = [ "command(rm -rf)" ];
        ask = [ "command(*)" ];
      };
      commands = {
        # changelog = {
        #   prompt =
        #     ''
        #     Your task is to parse the ``, ``, and `` from their input and use the `write_file` tool to correctly update the `CHANGELOG.md` file.
        #     '';
        #   description = "Adds a new entry to the project's CHANGELOG.md file.";
        # };
        "git/fixissue" = { # Becomes /git:fixissue
          prompt = "Please using gh analyze and fix issue number: {{args}}. Commit the changes and provide a summary of the fix. create a pull request in github repo via github mcp";
          description = "Generates a fix for a given GitHub issue.";
        };
      };
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
