{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    vesktop.package = pkgs.vesktop;

    config = {
      plugins = {
        # Force animations to played on everything that uses animations.
        alwaysAnimate.enable = true;

        # Always expands role list in profile popouts.
        alwaysExpandRoles.enable = true;

        # Handle trust based popups for files and links.
        alwaysTrust = {
          enable = true;

          domain = true;
          file = true;
        };

        # Use anonymous file names for uploads.
        anonymiseFileNames = {
          enable = true;

          anonymiseByDefault = true;
          method = "timestamp";
          randomisedLength = 16;
        };

        # Show server folders on dedicated sidebar, and adds folder related improvements.
        betterFolders = {
          enable = true;

          sidebar = true;
          sidebarAnim = true;

          closeAllFolders = false;
          closeAllHomeButton = false;
          closeOthers = false;
          forceOpen = true;
        };

        # Changes GIF alt text from 'GIF' to containing the GIF's tags/filename.
        betterGifAltText.enable = true;

        # Enhances the sessions menu and checks for new sessions in the background - displays notification on newly detected sessions.
        betterSessions = {
          enable = true;

          backgroundCheck = true;
          checkInterval = 15;
        };

        # Enhances the settings menu opening experience.
        betterSettings.enable = true;

        # Adds a call timer to all VCs.
        callTimer = {
          enable = true;

          format = "stopwatch";
        };

        # Removes tracking and telemetry from URLs.
        clearURLs.enable = true;

        # Disables console messages/errors, Discord's loggers, Spotify logger, and allows for whitelisted loggers.
        consoleJanitor = {
          enable = true;

          disableLoggers = true;
          disableSpotifyLogger = true;

          whitelistedLoggers = "
            GatewaySocket;
            Routing/Utils
          ";
        };

        # Disables getting kicked from DM voice calls after going AFK.
        disableCallIdle.enable = true;

        # Rounds relative timestamps down (ex: 7.6y becomes 7y instead of 8y).
        dontRoundMyTimestamps.enable = false;

        # Allows you to clone emotes and stickers to your own server.
        emoteCloner.enable = true;

        # Prevents images from being loaded as WEBP, which can cause quality loss.
        fixImagesQuality.enable = true;

        # Force owner crown even on large servers.
        forceOwnerCrown.enable = true;

        # Shows length of friendship on user popout.
        friendsSince.enable = true;

        # Display the server's online and total member count.
        memberCount = {
          enable = true;

          toolTip = true;
          memberList = true;
        };

        # Show user avatars inside of mentions.
        mentionAvatars.enable = true;

        # Attempts to log deleted and edited messages.
        messageLogger = {
          enable = true;

          logDeletes = true;
          logEdits = true;
          inlineEdits = true;

          ignoreBots = true;
        };

        # Hides incoming friend requests, message requests, and nitro offers.
        noPendingCount = {
          enable = true;

          hideFriendRequestsCount = false;
          hideMessageRequestCount = false;
          hidePremiumOffersCount = true;
        };

        # Strip canary/ptb from message links.
        normalizeMessageLinks.enable = true;

        # View the permissions that a user or channel has, and the roles of a server.
        permissionsViewer.enable = true;

        # Let's you preview your message before sending it.
        previewMessage.enable = true;

        # Notifies you when a friend, group chat, or server removes you.
        relationshipNotifier = {
          enable = true;
          notices = true;
        };

        # Replaces the default search engine from Google to DuckDuckGo
        replaceGoogleSearch = {
          enable = true;

          customEngineName = "DuckDuckGo";
          customEngineURL = "https://duckduckgo.com";
        };

        # Shows a timestamp on replied-message previews.
        replyTimestamp.enable = true;

        # Add ImageSearch to image context menus for reverse image searching.
        reverseImageSearch.enable = true;

        # Allows you to view information about a server.
        serverInfo.enable = true;

        # Show channels that you do not have access to view.
        showHiddenChannels.enable = true;

        # Display usernames next to nicknames.
        showMeYourName = {
          enable = true;

          mode = "user-nick";
        };

        # Add a toggle to the chat bar to allow sending silent messages.
        silentMessageToggle = {
          enable = true;

          autoDisable = false;
        };

        # Adds functionality to hide that you are typing.
        silentTyping = {
          enable = true;

          showIcon = true;
          contextMenu = true;

          isEnabled = true;
        };

        # Add an indicator to the server's channel list if someone is typing.
        typingIndicator = {
          enable = true;

          includeMutedChannels = true;
          includeBlockedUsers = true;

          indicatorMode = "both";
        };

        # Show avatars in the typing indicator.
        typingTweaks = {
          enable = true;

          showAvatars = true;
          showRoleColors = false;
          alternativeFormatting = true;
        };

        # Shows whether a user is currently in a voice channel somewhere on the profile.
        userVoiceShow = {
          enable = true;

          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };

        # Fixes "Message could not be loaded" upon hovering over a reply.
        validReply.enable = true;

        # Fixes mentions of unknown users showing up as "@unknown-user".
        validUser.enable = true;

        # Makes avatars and banners on user profiles clickable.
        viewIcons = {
          enable = true;

          format = "png";
        };
      };
    };
  };
}
