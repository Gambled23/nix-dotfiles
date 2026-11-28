{ self, inputs, pkgs, ... }: {
  flake.homeModules.antigravity-cli = { lib, ... }:
  let
    cyberSkillsDir = inputs.cybersecurity-skills + "/skills";
    cyberSkills = lib.filterAttrs
      (name: type: type == "directory" && !lib.hasPrefix "." name)
      (builtins.readDir cyberSkillsDir);
    cyberSkillsAttrs = lib.mapAttrs' (name: _:
      lib.nameValuePair name (cyberSkillsDir + "/${name}")
    ) cyberSkills;
  in {
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
        "alpha/addcontext" = { # Becomes /alpha:addcontext
          prompt = ''
              I'm hosting my apps on 'ssh alpha-server', use that to read logs.
              My apps are:
              /home/gambled/Codes/administrativo
              /home/gambled/Codes/cng-qr
              /home/gambled/Codes/factorio
              /home/gambled/Codes/facturacion
              /home/gambled/Codes/financiero
              /home/gambled/Codes/GrandCardon
              /home/gambled/Codes/identity
              /home/gambled/Codes/minutas
              /home/gambled/Codes/mindcare-app
              /home/gambled/Codes/nixos-alpha-server
              /home/gambled/Codes/FINOR
              /home/gambled/Codes/open-bsp-ui
              /home/gambled/Codes/quiniela
              /home/gambled/Codes/template-fullstack
              /home/gambled/Codes/cng-plus-ml
              They're all using nix and devenv environments.
            '';
          description = "Add context about alphapps";
        };
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
      skills = {
        m3e = ./skills/material-design-3-ui;
        ml-best-practices = ./skills/ml-best-practices;
        cng-diseno = ./skills/cng-diseno;
      } // cyberSkillsAttrs;
    };
  };
}
