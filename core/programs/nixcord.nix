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
      themeLinks = [
        "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/refs/heads/master/Themes/SettingsModal/SettingsModal.theme.css"
        #"https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/gruvbox-material.theme.css"
        "https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css"
      ];

      plugins = {
        accountPanelServerProfile.enable = true;
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
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
        volumeBooster.enable = true;
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
      };
    };
  };
}
