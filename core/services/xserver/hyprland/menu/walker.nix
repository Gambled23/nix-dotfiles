{ inputs, ... }: {
  # services.walker = {
  #   enable = true;
  #   settings = {
  #     close_when_open = true;
  #     click_to_close = true;
  #   };
  # };

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      placeholders."default" = { input = "Search"; list = "No results"; };
      # use: elephant listproviders
      proviers.default = [
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
      providers.prefixes = [
        {provider = "websearch"; prefix = "+";}
        {provider = "providerlist"; prefix = "_";}
      ];
      keybinds.quick_activate = ["F1" "F2" "F3"];
      resume_last_query = true;
    };
  };
}