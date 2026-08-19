{ self, inputs, ... }: {
  flake.nixosModules.suwayomi = { pkgs, ... }: {
    services.suwayomi-server = {
      enable = true;
      openFirewall = true;

      settings = {
        server.systemTrayEnabled = true;
        server.extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ]; 
        server.webUIEnabled = true;
        server.initialOpenInBrowserEnabled = true;
        server.webUIInterface = "browser";
        server.webUIFlavor = "WebUI";
        server.basicAuthEnabled = false;
        server.port = 4567;
      };
    };
  };
}
