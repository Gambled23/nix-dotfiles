{ self, inputs, ... }: {
  flake.nixosModules.vaultwarden = { pkgs, lib, config, ... }: {
    services.vaultwarden = {
      enable = true;
      dbBackend = "sqlite";

      config = {
        ROCKET_ADDRESS = "0.0.0.0";
        ROCKET_PORT = 8222;
        DOMAIN = "http://server-gambled";
        SIGNUPS_ALLOWED = true;
      };
    };

    networking.firewall = {
      allowedUDPPorts = [ 8222 ];
      allowedTCPPorts = [ 8222 8443 ];
    };

    environment.systemPackages = [
      pkgs.vaultwarden
    ];

    services.nginx = let vault-host = "server-gambled"; in {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts."${vault-host}" = {
        listen = [ { addr = "0.0.0.0"; port = 8443; ssl = true; } ];
        onlySSL = true;

        sslCertificate = "/etc/ssl/local/server-gambled.crt";
        sslCertificateKey = "/etc/ssl/local/server-gambled.key";

        extraConfig = ''
          access_log /var/log/nginx/${vault-host}.access.log;
          error_log /var/log/nginx/${vault-host}.error.log;
        '';
        locations."/" = {
          proxyPass = "http://0.0.0.0:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };
    };
  };
}
