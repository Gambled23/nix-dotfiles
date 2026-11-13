{ self, inputs, ... }: {
  flake.homeModules.matugen = { config, lib, pkgs, ... }:

  let
      cfg = config.programs.matugen;
      tomlFormat = pkgs.formats.toml { };

      templatesSrc = pkgs.runCommand "matugen-community-templates" { } ''
        cp -r ${inputs.community-templates}/. "$out"
        chmod -R u+w "$out"
        find "$out" -type f ! -name template.toml -exec sed -E -i \
          -e 's/\{\{\{/{/g' \
          -e 's/\{\{[[:space:]]*/{{ /g' \
          -e 's/[[:space:]]*\}\}/ }}/g' \
          -e 's/\| ([a-z_]+) ([+-]?[0-9]+(\.[0-9]+)?)/| \1: \2/g' \
          -e 's/colors\.terminal_normal_black\.[a-z_]+\./colors.surface.default./g' \
          -e 's/colors\.terminal_normal_red\.[a-z_]+\./colors.error.default./g' \
          -e 's/colors\.terminal_normal_green\.[a-z_]+\./colors.tertiary.default./g' \
          -e 's/colors\.terminal_normal_yellow\.[a-z_]+\./colors.secondary.default./g' \
          -e 's/colors\.terminal_normal_blue\.[a-z_]+\./colors.primary.default./g' \
          -e 's/colors\.terminal_normal_magenta\.[a-z_]+\./colors.tertiary.default./g' \
          -e 's/colors\.terminal_normal_cyan\.[a-z_]+\./colors.secondary.default./g' \
          -e 's/colors\.terminal_normal_white\.[a-z_]+\./colors.on_surface.default./g' \
          -e 's/colors\.terminal_bright_black\.[a-z_]+\./colors.outline.default./g' \
          -e 's/colors\.terminal_bright_red\.[a-z_]+\./colors.error.default./g' \
          -e 's/colors\.terminal_bright_green\.[a-z_]+\./colors.tertiary.default./g' \
          -e 's/colors\.terminal_bright_yellow\.[a-z_]+\./colors.secondary.default./g' \
          -e 's/colors\.terminal_bright_blue\.[a-z_]+\./colors.primary.default./g' \
          -e 's/colors\.terminal_bright_magenta\.[a-z_]+\./colors.tertiary.default./g' \
          -e 's/colors\.terminal_bright_cyan\.[a-z_]+\./colors.secondary.default./g' \
          -e 's/colors\.terminal_bright_white\.[a-z_]+\./colors.on_surface.default./g' \
          -e 's/colors\.terminal_background\.[a-z_]+\./colors.surface.default./g' \
          -e 's/colors\.terminal_foreground\.[a-z_]+\./colors.on_surface.default./g' \
          -e 's/colors\.terminal_cursor\.[a-z_]+\./colors.primary.default./g' \
          -e 's/colors\.terminal_selection_bg\.[a-z_]+\./colors.surface_variant.default./g' \
          -e 's/colors\.terminal_selection_fg\.[a-z_]+\./colors.on_surface_variant.default./g' \
          -e 's/\{\{ config_dir \}\}/config_dir/g' \
          {} +
      '';
      dirContents = builtins.readDir templatesSrc;
      appDirs = lib.filterAttrs (name: type: type == "directory" && !lib.hasPrefix "." name) dirContents;

      expandXdgPath = path:
        builtins.replaceStrings
          [ "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" ]
          [ config.xdg.configHome config.xdg.dataHome config.xdg.stateHome ]
          path;

      # Dynamically parse each application folder in community-templates
      parseAppTemplates = dirName:
        let
          dirPath = "${templatesSrc}/${dirName}";
          manifestPath = "${dirPath}/template.toml";
        in
          if builtins.pathExists manifestPath then
            let
              manifest = builtins.fromTOML (builtins.readFile manifestPath);
              templates = manifest.templates or { };
            in
              lib.mapAttrs' (tName: tVal:
                let
                  inputRel =
                    if tVal ? input_path then
                      tVal.input_path
                    else if tVal ? input_path_modes then
                      (tVal.input_path_modes.${cfg.variant} or tVal.input_path_modes.dark or tVal.input_path_modes.light)
                    else
                      null;

                  rawOutput = tVal.output_path or null;
                  outputPaths =
                    if builtins.isList rawOutput then
                      map expandXdgPath rawOutput
                    else if builtins.isString rawOutput then
                      [ (expandXdgPath rawOutput) ]
                    else
                      [ ];

                  runtimeDir = "${config.xdg.stateHome}/matugen/${dirName}";
                  fixedHook =
                    if tVal ? post_hook then
                      let
                        hook = builtins.replaceStrings
                          [ "{{ config_dir }}" dirPath ]
                          [ runtimeDir runtimeDir ]
                          tVal.post_hook;
                        guardedHook =
                          if dirName == "spicetify" then
                            "if command -v spicetify >/dev/null 2>&1; then ${hook}; else echo 'matugen: spicetify is not installed; skipping template hook' >&2; fi"
                          else if dirName == "tmux" then
                            "if command -v tmux >/dev/null 2>&1; then ${hook}; else echo 'matugen: tmux is not installed; skipping template hook' >&2; fi"
                          else if dirName == "libreoffice" then
                            "if command -v python3 >/dev/null 2>&1 && command -v zip >/dev/null 2>&1; then ${hook}; else echo 'matugen: python3 or zip is not installed; skipping template hook' >&2; fi"
                          else
                            hook;
                      in
                        "mkdir -p '${runtimeDir}' && chmod -R u+w '${runtimeDir}' && cp -r '${dirPath}/.' '${runtimeDir}/' && ${guardedHook}"
                    else
                      null;
                in
                  lib.nameValuePair "${dirName}_${tName}" ({
                    input_path = "${dirPath}/${inputRel}";
                    output_path = outputPaths;
                  } // lib.optionalAttrs (fixedHook != null) {
                    post_hook = fixedHook;
                  })
              ) (lib.filterAttrs (_: tVal: (tVal ? input_path || tVal ? input_path_modes) && tVal ? output_path) templates)
          else
            { };

      selectedCommunityTemplates = lib.foldl'
        (acc: dirName:
          assert lib.assertMsg (builtins.hasAttr dirName appDirs)
            "programs.matugen.communityTemplates contains unknown template directory: ${dirName}";
          acc // (parseAppTemplates dirName)
        )
        { }
        cfg.communityTemplates;

      noctaliaTemplates = {
        accela = {
          input_path = "${config.xdg.configHome}/noctalia/templates/accela.nix";
          output_path = [ "${config.xdg.configHome}/Tachibana Labs/theme.conf" ];
        };
        beeper = {
          input_path = "${config.xdg.configHome}/noctalia/templates/beeper.css";
          output_path = [ "${config.xdg.configHome}/BeeperTexts/custom.css" ];
        };
        nvf = {
          input_path = "${config.xdg.configHome}/noctalia/templates/nvf.nix";
          output_path = [ "/etc/nixos/modules/features/ricing/shells/noctalia/_Colors/nvf.nix" ];
        };
        # spicetify-nix = {
        #   input_path = "${config.xdg.configHome}/spicetify/Themes/Comfy/color.ini";
        #   output_path = [ "/etc/nixos/modules/features/ricing/shells/noctalia/_Colors/spicetify.ini" ];
        # };
        # starship = {
        #   input_path = "${config.xdg.configHome}/noctalia/templates/starship.toml";
        #   output_path = [ "${config.xdg.configHome}/noctalia/templates/ignore" ];
        # };
      };

      matugenConfigFile = tomlFormat.generate "matugen-config.toml" {
        config = cfg.config;
        templates = selectedCommunityTemplates // noctaliaTemplates // cfg.templates;
      };
    in
    {
      imports = builtins.filter
        (lib.hasSuffix ".nix")
        (lib.filesystem.listFilesRecursive ./shells/noctalia/_Colors/Templates);

      options.programs.matugen = {
        enable = lib.mkEnableOption "Matugen color generator";

        package = lib.mkPackageOption pkgs "matugen" { };

        variant = lib.mkOption {
          type = lib.types.enum [ "dark" "light" ];
          default = "dark";
          description = "Default theme variant to generate/prefer for templates.";
        };

        communityTemplates = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "Community template directories to include in Matugen's configuration.";
        };

        config = lib.mkOption {
          type = lib.types.attrs;
          default = { };
          description = "Additional options for the [config] section in matugen's config.toml.";
        };

        templates = lib.mkOption {
          type = lib.types.attrsOf lib.types.attrs;
          default = { };
          description = "Additional custom matugen templates to append to the community templates.";
        };
      };

      config = lib.mkIf cfg.enable {
        home.packages = [ cfg.package ];

        # Manage matugen's config.toml and templates dynamically through Home Manager
        xdg.configFile."matugen/config.toml".source = matugenConfigFile;

        gtk = {
          enable = lib.mkDefault true;
          gtk4.extraCss = lib.mkDefault ''
            @import url("dank-colors.css");   
            @import url("${config.xdg.configHome}/gtk-4.0/gtk.css");
          '';
          gtk3.extraCss = lib.mkDefault ''
            @import url("dank-colors.css");   
            @import url("${config.xdg.configHome}/gtk-3.0/gtk.css");
          '';
        };
      };
    };
}
