{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    config = {
      themeLinks = [        # or use an online theme
        "https://raw.githubusercontent.com/catppuccin/discord/main/themes/frappe.theme.css"
        "https://raw.githubusercontent.com/DiscordStyles/RadialStatus/deploy/RadialStatus.theme.css"
        "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css"
        "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/refs/heads/master/Themes/SettingsModal/SettingsModal.theme.css"
      ];
      plugins = {
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        fakeNitro.enable = true;
        gameActivityToggle.enable = true;
        implicitRelationships.enable = true;
        lastFMRichPresence = {
          enable = true;
          username = "Gambled23";
          apiKey = "1542ad92a0c24e9e2e17abdaedd49afc";
          hideWithSpotify = false;
          nameFormat = "artist-first";
          useListeningStatus = true;
          showLastFmLogo = false;
        };
        mentionAvatars.enable = true;
        platformIndicators.enable = true;
        serverListIndicators.enable = true;
        spotifyControls.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
      };
    };
  };
}
