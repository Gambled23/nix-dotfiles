{ self, inputs, ... }: {
  flake.nixosModules.pihole = { config, pkgs, lib, ... }: {
    networking = {
      hosts = {
        "192.168.1.1" = [ "gateway.gambled.com" ];
        "192.168.1.25" = [ "pc.gambled.com" ];
        "192.168.1.27" = [ "server.gambled.com" ];
        "192.168.1.44" = [ "pixel.gambled.com" ];
        "192.168.1.45" = [ "tv-sala.gambled.com" ];
        "192.168.1.46" = [ "motorola-nancy.gambled.com" ];
        "192.168.1.49" = [ "tv-nancy.gambled.com" ];
      };
    };

    services = {
      dnsmasq = {
        enable = false;
        settings = {
          address = [
            "/feelinsonice-hrd.appspot.com/ # Block Snapchat"
            "/feelinsonice.appspot.com/ # Block Snapchat"
            "/snapchat.com/ # Block Snapchat"
          ];
          dhcp-name-match = [
            "set:hostname-ignore,wpad"
            "set:hostname-ignore,localhost"
          ];
          dhcp-option = [
            "vendor:MSFT,27,1i"
            "6,192.168.1.27"
          ];
          domain = [
            "gambled.com,192.168.1.0/24,local"
          ];
        };
      };

      pihole-ftl = {
        enable = true;
        lists = [
          {
            url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
            type = "block";
            enabled = true;
            description = "Steven Black's HOSTS";
          }
          {
            url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt";
            type = "block";
            enabled = true;
            description = "hagezi adblock pro";
          }
        ];
        openFirewallDNS = true;
        openFirewallDHCP = true;
        openFirewallWebserver = true;
        queryLogDeleter.enable = true;
        settings = {
          "misc.readOnly" = false;
          dhcp = {
            active = false;
            end = "192.168.1.254";
            hosts = [ ];
            ipv6 = false;
            leaseTime = "24h";
            start = "192.168.1.61";
            rapidCommit = true;
            resolver = {
              resolveIPv6 = false;
            };
            router = "192.168.1.1";
          };
          dns = {
            cnameRecords = [
              "color-printer,office-printer"
              "color-printer.gambled.com,office-printer.gambled.com"
            ];
            domain = "gambled.com";
            domainNeeded = true;
            expandHosts = true;
            interface = "eth0";
            hosts = [
              "192.168.1.1   gateway"
              "192.168.1.27   pi-hole"
            ];
            upstreams = [ "1.1.1.1" "1.1.1.27" ];
          };
          ntp = {
            ipv4.active = false;
            ipv6.active = false;
            sync.active = false;
          };
        };
        useDnsmasqConfig = true;
      };

      resolved = {
        settings = {
          Resolve = {
            DNSStubListener = false;
            MulticastDNS = false;
          };
        };
      };
    };

    services.pihole-web = {
      enable = true;
      ports = [ "443s" ];
    };
  };
}
