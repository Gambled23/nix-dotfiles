{...}:{
    services.bezsel = {
        agent = {
            enable = true;
            openFirewall = true; # 45876
            smartmon.enable
        };

        hub = {
            enable = true;
            host = "0.0.0.0";
            port = 8090;
        };
    };
}