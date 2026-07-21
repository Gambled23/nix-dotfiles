{inputs, pkgs, ...}:
{
    imports = [
        inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
        enable = true;
        package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

        # Optional configuration
        greeter-args = "";
        settings = {
            cursor = {
                theme = "Bibata-Modern-Ice";
                size = 24;
                path = "${pkgs.bibata-cursors}/share/icons";
            };
            keyboard = {
                layout = "us";
            };
        };
    };
    
    services.displayManager = {
        defaultSession = "mango";

        autoLogin.enable = true;
        autoLogin.user = "gambled";
    };
}
