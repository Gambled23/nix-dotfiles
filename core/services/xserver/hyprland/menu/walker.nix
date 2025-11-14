{ inputs, ... }: {

  # No longer a home manager option but a home maanager module
  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      placeholders."default" = { input = "Search"; list = "No results"; };
      providers = {
        # use: elephant listproviders
        default = [
          "bluetooth"
          "calc"
          "clipboard"
          "desktopapplications"
          "files"
          "runner"
          "symbols"
          "unicode"
          "websearch"
        ];
        prefixes = [
          {provider = "websearch"; prefix = "@";}
          {provider = "calc"; prefix = "=";}
          {provider = "providerlist"; prefix = "_";}
        ];
        # empty = ["desktopapplications" "websearch" "calc"];
      };
      keybinds.quick_activate = ["F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" "F10" "F11" "F12"];
      resume_last_query = true;
    };
  };
}