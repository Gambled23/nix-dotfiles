{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;

    discord.enable = true;
    equibop.enable = false;
    vesktop.enable = false;

    discord.equicord.enable = true;
    discord.vencord.enable = false;
    
    config = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;
      transparent = true;

      enabledThemes = [ "noctalia.theme.css" ];

      plugins = {
        accountPanelServerProfile.enable = true;
        bannersEverywhere = {
          enable = true;
          animate = true;
        };
        betterActivities.enable = true;
        betterAudioPlayer.enable = true;
        betterFolders.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNsfw.enable = true;
        channelTabs.enable = true;
        characterCounter.enable = true;
        clickableRoles.enable = true;
        customTimestamps = {
          formats = {
            enable = false;
          };
        };
        declutter.enable = true;
        exitSounds.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        friendshipRanks.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle.enable = true;
        implicitRelationships.enable = true;
        mentionAvatars.enable = true;
        moreCommands.enable = true;
        moreStickers.enable = true;
        moreUserTags = {
          tagSettings = {
            administrator = {
              enable = false;
            };
            chatModerator = {
              enable = false;
            };
            moderator = {
              enable = false;
            };
            moderatorStaff = {
              enable = false;
            };
            owner = {
              enable = false;
            };
            voiceModerator = {
              enable = false;
            };
            webhook = {
              enable = false;
            };
            enable = false;
          };
        };
        moyai.enable = true;
        noNitroUpsell.enable = true;
        platformIndicators.enable = true;
        richMagnetLinks.enable = true;
        statusWhileActive.enable = true;
        steamStatusSync.enable = true;
        themeLibrary.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        userPfp.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        volumeBooster.enable = true;
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
        whosWatching.enable = true;
      };

      themeLinks = [ 
        https://github.com/refact0r/system24/blob/main/theme/flavors/system24-vencord.theme.css
      ];
    };
    
    extraConfig.plugins = {
      fakeNitro = {
        useHyperLinks = true;
      };
      fontLoader = {
        applyOnClodeBlocks = false;
      };
      globalBadges = {
        showRa1ncord = true;
      };
      messageClickActions = {
        enableDeleteOnClick = true;
        enableDoubleClickToEdit = true;
        enableDoubleClickToReply = true;
        requireModifier = false;
      };
      musicRichPresence = {
        showLastFmLogo = true;
      };
      noBlockedMessages = {
        applyToIgnoredUsers = true;
        ignoreBlockedMessages = false;
        ignoreMessages = false;
      };
      platformIndicators = {
        badges = true;
      };
      showHiddenChannels = {
        hideUnreads = true;
      };
      showMeYourName = {
        displayNames = false;
        friendNicknames = "dms";
        inReplies = false;
        mode = "user-nick";
      };
      silentTyping = {
        contextMenu = true;
        isEnabled = true;
        showIcon = false;
      };
      translate = {
        shavian = true;
        sitelen = true;
        target = "en";
        toki = true;
      };
    };
  };
}
