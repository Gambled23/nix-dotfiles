{ self, inputs, ... }: {
  flake.nixosModules.sunshine = { pkgs, ... }: {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
      settings = {
        sunshine_name = "el sunchine";
      };
      applications = {
        env = {
          PATH = "$(PATH):$(HOME)/.local/bin";
        };
        apps = [
          {
            name = "steamdeck";
            cmd = "";
            exclude-global-prep-cmd = "false";
            elevated = "false";
            detached = [
              "display-device -d steamdeck"
            ];
            prep-cmd = [
              {
                do = "";
                undo = "";
                elevated = false;
              }
            ];
          }
          {
            name = "pc-gambled";
            cmd = "";
            exclude-global-prep-cmd = "false";
            elevated = "false";
            detached = [
              "display-device -d pc-gambled"
            ];
          }
          {
            name = "dev-gambled";
            cmd = "";
            exclude-global-prep-cmd = "false";
            elevated = "false";
            detached = [
              "display-device -d dev-gambled"
            ];
            prep-cmd = [
              {
                do = "";
                undo = "";
                elevated = false;
              }
            ];
          }
          {
            name = "pixel";
            cmd = "";
            exclude-global-prep-cmd = "false";
            elevated = "false";
            detached = [
              "display-device -d pixel"
            ];
            prep-cmd = [
              {
                do = "";
                undo = "";
                elevated = false;
              }
            ];
          }
          {
            name = "no-change";
            exclude-global-prep-cmd = "false";
            elevated = "false";
          }
        ];
      };
    };
  };
}
