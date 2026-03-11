{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nixcord = {
    enable = true;
    discord.enable = true;
    discord.equicord.enable = true;
    discord.vencord.enable = false;
    vesktop.enable = false;
    config = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;
      transparent = true;

      plugins = {
        accountPanelServerProfile.enable = true;
        betterActivities.enable = true;
        betterAudioPlayer.enable = true;
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        # forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        friendshipRanks.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle.enable = true;
        ghosted.enable = true;
        implicitRelationships.enable = true;
        # lastFMRichPresence = {
        #   enable = true;
        #   username = "Gambled23";
        #   apiKey = "1542ad92a0c24e9e2e17abdaedd49afc";
        #   hideWithSpotify = false;
        #   nameFormat = "artist-first";
        #   useListeningStatus = true;
        #   showLastFmLogo = false;
        # };
        mentionAvatars.enable = true;
        moyai.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        moreStickers.enable = true;
        noNitroUpsell.enable = true;
        noOnboarding.enable = true;
        platformIndicators.enable = true;
        # serverListIndicators.enable = true;
        # spotifyControls.enable = true;
        sidebarChat.enable = true;
        sekaiStickers.enable = true;
        statusWhileActive.enable = true;
        steamStatusSync.enable = true;
        themeLibrary.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        userVoiceShow.enable = true;
        UserPFP.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 2.0;
        };
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
      };

      themeLinks = [
        https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css
      ];
    };
  };
}
