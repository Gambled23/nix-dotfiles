{inputs, pkgs, config, lib, ... }: {
  networking = {
    hosts = {
      "192.168.1.1" = ["gateway.gambled.com" "gateway"];
      "192.168.1.27" = ["pi-hole.gambled.com" "pi-hole"];
      "192.168.1.44" = ["pixel9.gambled.com" "pixel9"];
      "192.168.1.45" = ["tv-sala.gambled.com" "tv-sala"];
      "192.168.1.46" = ["motorola-nancy.gambled.com" "motorola-nancy"];
    };
  };

  services = {
    # I'm not actually using the dnsmasq service. Pi-hole provides
    # it's own dnsmasq. I'm using Nix' ability to manage the
    # dnsmasq-style configuration file that Pi-hole utilizes.
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
        # Set DHCP option 6 to the DNS server you nodes should use.
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
          active = false; # <-- SET TO TRUE ONLY WHEN YOU'RE READY!
          end = "192.168.1.254";
          hosts = [
            # "00:00:5e:00:53:01,192.168.1.22,jane-laptop"
            # "00:00:5e:00:53:ab,bill-desktop"
            # "00:00:5e:00:53:ff,office-printer"
          ];
          ipv6 = false;
          leaseTime = "24h";
          start = "192.168.1.61";
          rapidCommit = true;
          resolver = {
            resolveIPv6 = false;
          };
          router = "192.168.1.1";
        };
        # misc.readOnly = false;
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
            # "192.168.1.15  nas"
          ];
          upstreams = ["1.1.1.1" "1.1.1.27"];
        };
        # Let's not use Pi-hole time service. My home router provides clock.
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
}
