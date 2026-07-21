{ pkgs, lib, spicetify-nix, config, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    spicetify-nix.homeManagerModules.default
  ];
  
  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.comfy;

    theme = {
      name = "Colorful";
      src = pkgs.fetchFromGitHub {
        owner = "sanoojes";
        repo = "spicetify-colorful";
        rev = "main";
        hash = "sha256-H9Hv97ZUGB7f3uAhxonWbO6KhP074X09hDDORl7ASiQ=";
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
      Noctalia = builtins.readFile ../../Ricing/Shells/Noctalia/Colors/spicetify.ini;
    };

    enabledCustomApps = with spicePkgs.apps; [
      # marketplace
      # betterLibrary
    ];

    enabledExtensions = with spicePkgs.extensions; [
      # adblock
      # addToQueueTop
      # beautifulLyrics
      # bookmark
      # copyToClipboard
      # goToSong
      # groupSession
      # history
      # lastfm
      # loopyLoop
      # playNext
      # popupLyrics
      # powerBar
      # savePlaylists
      # sectionMarker
      # skipOrPlayLikedSongs
      # showQueueDuration
      # shuffle
      # volumePercentage
    ];

    wayland = true;
    windowManagerPatch = true;
  };
}
