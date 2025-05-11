{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles."gambled" = {
      id = 0;
      name = "gambled";
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "http://home-gambled:8123/lovelace/default_view";
        "browser.toolbars.bookmarks.visibility" = "always";
        # Hardware acceleration
        "gfx.webrender.all" = true;
        #"media.ffmpeg.vaapi.enabled" = true;
        # Privacy settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        # As well as Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
        "extensions.autoDisableScopes" = 0;
      };
      search = {
        force = true;
        default = "google";
        order = [ "google" ];
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixp" ];
          };
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixo" ];
          };
          "Nix home manager" = {
            urls = [{
              template = "https://home-manager-options.extranix.com/";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixh" ];
          };
          "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        };
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        refined-github
        sponsorblock
        return-youtube-dislikes
        augmented-steam
        gruvbox-dark-theme
      ];
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Google";
            toolbar = true;
            bookmarks = [
              {
                name = "Photos";
                url = "https://photos.google.com/";
              }
              {
                name = "Calendar";
                url = "https://calendar.google.com/";
              }
              {
                name = "Drive";
                url = "https://drive.google.com/";
              }
              {
                name = "Maps";
                url = "https://www.google.com/maps";
              }
              {
                name = "Keep";
                url = "https://keep.google.com/";
              }
              {
                name = "Gmail";
                url = "https://mail.google.com/";
              }
            ];
          }
          {
            name = "Stuff";
            toolbar = true;
            bookmarks = [
              {
                name = "Resoomer";
                url = "https://resoomer.com/es/";
              }
              {
                name = "Fake mail";
                url = "https://www.guerrillamail.com/es/inbox?mail_id=528729674";
              }
              {
                name = "Scribbr";
                url = "https://www.scribbr.es/citar/generador/apa/";
              }
              {
                name = "Skinport";
                url = "https://skinport.com/";
              }
            ];
          }
          {
            name = "Code";
            toolbar = true;
            bookmarks = [
              {
                name = "Material Theme Builder";
                url = "https://www.figma.com/design/XOmxjkFAVpfUEF7FKmlo5P/Material-Theme-Builder-playground-(Copy)?node-id=0-1";
              }
              {
                name = "Bootstrap components";
                url = "https://fastbootstrap.com/components/pills/#";
              }
              {
                name = "Material icons";
                url = "https://fonts.google.com/icons?icon.platform=web";
              }
              {
                name = "SVG free";
                url = "https://undraw.co/search";
              }
              {
                name = "UIverse";
                url = "https://uiverse.io/";
              }
              {
                name = "Neobrutalism";
                url = "https://www.neobrutalism.dev/";
              }
            ];
          }
          {
            name = "Guitar";
            toolbar = true;
            bookmarks = [
              {
                name = "Mi otra mitad";
                url = "https://www.tiktok.com/@.tikrocker/video/7372672445217606945/";
              }
              {
                name = "Podria estar peor";
                url = "https://www.youtube.com/watch?v=dCncPADeUH0";
              }
              {
                name = "Esquemas";
                url = "https://www.youtube.com/watch?v=LMrzogSM-wA&list=PLH2OGc6yjJ8rFJI-BFPlcVroTIrNcx6SE&index=12";
              }
              {
                name = "Haz lo que quieras conmigo";
                url = "https://www.youtube.com/watch?v=wIaXlMtoqwA&t=107s";
              }
              {
                name = "Los niños del parque";
                url = "https://www.youtube.com/watch?v=T9NyVcYBrKs&t=13s";
              }
              {
                name = "Mirame";
                url = "https://www.youtube.com/watch?v=SqEcDruhnKg&t=115s";
              }
              {
                name = "Chord progression";
                url = "https://www.youtube.com/watch?v=bu88LIPzRbs";
              }
              {
                name = "Improvisation";
                url = "https://www.youtube.com/watch?v=sX3dqStq0ag";
              }
            ];
          }
        ];
      };
    };
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };
}