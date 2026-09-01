{ self, inputs, ... }: {
  flake.nixosModules.moonshine = { pkgs, ... }: {
    imports = [ inputs.moonshine.nixosModules.default ];

    services.moonshine = {
      enable = true;
      user = "gambled";
      uid = 1000;
      openFirewall = true;

      settings = {
        application = [
          {
            title = "steamdeck";
            command = [
              "display-device -d steamdeck"
            ];
          }
          {
            title = "pc-gambled";
            command = [
              "display-device -d pc-gambled"
            ];
          }
          {
            title = "dev-gambled";
            command = [
              "/run/current-system/sw/bin/steam"
              "steam://open/bigpicture"
            ];
          }
          {
            title = "pixel";
            command = [
              "display-device -d pixel"
            ];
          }
          {
            title = "no-change";
            command = [
              ""
            ];
          }
        ];
      };
    };

    users.users.gambled.extraGroups = [ "input" "moonshine" ];
  };
}
