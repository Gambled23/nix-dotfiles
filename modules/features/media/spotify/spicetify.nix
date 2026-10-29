{ self, inputs, ... }: {
  flake.homeModules.spicetify = { pkgs, lib, config, ... }: let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      inputs.spicetify-nix.homeManagerModules.default
    ];
    
    programs.spicetify = {
      enable = true;

      theme = {
        name = "Colorful";
        src = pkgs.fetchFromGitHub {
          owner = "sanoojes";
          repo = "spicetify-colorful";
          rev = "main";
          hash = "sha256-nvAuu4dmSRxmLnDCzBKEBjTLg+49O9rIq391pwGB0wM=";
        };
        
        injectCss = true;
        replaceColors = true;
        injectThemeJs = true;
        overwriteAssets = true;
        homeConfig = true;
        additonalCss = "";
      };

      # Noctalia custom color scheme
      colorScheme = "custom";
      
      customColorScheme = {
        Noctalia = builtins.readFile ../../ricing/shells/noctalia/_Colors/spicetify.ini;
      };

      enabledCustomApps = with spicePkgs.apps; [
      ];

      enabledExtensions = with spicePkgs.extensions; [
        keyboardShortcut
      ];

      wayland = true;
      windowManagerPatch = true;
    };
  };
}
