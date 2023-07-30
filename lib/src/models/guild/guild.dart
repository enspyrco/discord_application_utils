import 'package:json_utils/json_utils.dart';

import '../emoji/emoji.dart';
import '../role.dart';
import '../snowflake.dart';
import '../stickers/sticker.dart';
import 'welcome_screen.dart';

// https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
final class Guild {
  const Guild._(
    this.id,
    this.name,
    this.icon,
    this.iconHash,
    this.splash,
    this.discoverySplash,
    this.owner,
    this.ownerId,
    this.permissions,
    this.region,
    this.afkChannelId,
    this.afkTimeout,
    this.widgetEnabled,
    this.widgetChannelId,
    this.verificationLevel,
    this.defaultMessageNotifications,
    this.explicitContentFilter,
    this.roles,
    this.emojis,
    this.features,
    this.mfaLevel,
    this.applicationId,
    this.systemChannelId,
    this.systemChannelFlags,
    this.rulesChannelId,
    this.maxPresences,
    this.maxMembers,
    this.vanityUrlCode,
    this.description,
    this.banner,
    this.premiumTier,
    this.premiumSubscriptionCount,
    this.preferredLocale,
    this.publicUpdatesChannelId,
    this.maxVideoChannelUsers,
    this.maxStageVideoChannelUsers,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.welcomeScreen,
    this.nsfwLevel,
    this.stickers,
    this.premiumProgressBarEnabled,
    this.safetyAlertsChannelId,
  );

  // guild id
  final Snowflake id;

  // guild name (2-100 characters, excluding trailing and leading whitespace)
  final String name;

  // icon hash
  final String? icon;

  // icon hash, returned when in the template object
  final String? iconHash;

  // splash hash
  final String? splash;

  // discovery splash hash; only present for guilds with the "DISCOVERABLE" feature
  final String? discoverySplash;

  // true if the user is the owner of the guild
  // These fields are only sent when using the GET Current User Guilds endpoint and are relative to the requested user
  final bool? owner;

  // id of owner
  final Snowflake ownerId;

  // total permissions for the user in the guild (excludes overwrites)
  // These fields are only sent when using the GET Current User Guilds endpoint and are relative to the requested user
  final String? permissions;

  // voice region id for the guild (deprecated)
  // This field is deprecated and is replaced by channel.rtc_region
  final String? region;

  // id of afk channel
  final Snowflake? afkChannelId;

  // afk timeout in seconds
  final int afkTimeout;

  // true if the server widget is enabled
  final bool? widgetEnabled;

  // the channel id that the widget will generate an invite to, or null if set to no invite
  final Snowflake? widgetChannelId;

  // verification level required for the guild
  final int verificationLevel;

  // default message notifications level
  final int defaultMessageNotifications;

  // explicit content filter level
  final int explicitContentFilter;

  // roles in the guild
  final List<Role> roles;

  // custom guild emojis
  final List<Emoji> emojis;

  // enabled guild features
  // array of guild feature strings: https://discord.com/developers/docs/resources/guild#guild-object-guild-features
  final List<String> features;

  // required MFA level for the guild
  final int mfaLevel;

  // application id of the guild creator if it is bot-created
  final Snowflake? applicationId;

  // the id of the channel where guild notices such as welcome messages and boost events are posted
  final Snowflake? systemChannelId;

  // system channel flags
  final int systemChannelFlags;

  // the id of the channel where Community guilds can display rules and/or guidelines
  final Snowflake? rulesChannelId;

  // the maximum number of presences for the guild (null is always returned, apart from the largest of guilds)
  final int? maxPresences;

  // the maximum number of members for the guild
  final int? maxMembers;

  // the vanity url code for the guild
  final String? vanityUrlCode;

  // the description of a guild
  final String? description;

  // banner hash
  final String? banner;

  // premium tier (Server Boost level)
  final int premiumTier;

  // the number of boosts this guild currently has
  final int? premiumSubscriptionCount;

  // the preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
  final String preferredLocale;

  // the id of the channel where admins and moderators of Community guilds receive notices from Discord
  final Snowflake? publicUpdatesChannelId;

  // the maximum amount of users in a video channel
  final int? maxVideoChannelUsers;

  // the maximum amount of users in a stage video channel
  final int? maxStageVideoChannelUsers;

  // approximate number of members in this guild, returned from the GET /guilds/<id> and /users/@me/guilds endpoints when with_counts is true
  final int? approximateMemberCount;

  // approximate number of non-offline members in this guild, returned from the GET /guilds/<id> and /users/@me/guilds endpoints when with_counts is true
  final int? approximatePresenceCount;

  // the welcome screen of a Community guild, shown to new members, returned in an Invite's guild object
  final WelcomeScreen? welcomeScreen;

  // guild NSFW level
  final int nsfwLevel;

  // custom guild stickers
  final List<Sticker> stickers;

  // whether the guild has the boost progress bar enabled
  final bool premiumProgressBarEnabled;

  // the id of the channel where admins and moderators of Community guilds receive safety alerts from Discord
  final Snowflake? safetyAlertsChannelId;

  factory Guild.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String name,
          'icon': String? icon,
          'icon_hash': String? iconHash,
          'splash': String? splash,
          'discovery_splash': String? discoverySplash,
          'owner': bool? owner,
          'owner_id': String ownerIdString,
          'permissions': String? permissions,
          'region': String? region,
          'afk_channel_id': String? afkChannelIdString,
          'afk_timeout': int afkTimeout,
          'widget_enabled': bool? widgetEnabled,
          'widget_channel_id': String? widgetChannelIdString,
          'verification_level': int verificationLevel,
          'default_message_notifications': int defaultMessageNotifications,
          'explicit_content_filter': int explicitContentFilter,
          'roles': JsonList rolesJsonList,
          'emojis': JsonList emojisJsonList,
          'features': JsonList featuresJsonList,
          'mfa_level': int mfaLevel,
          'application_id': String? applicationIdString,
          'system_channel_id': String? systemChannelIdString,
          'system_channel_flags': int systemChannelFlags,
          'rules_channel_id': String? rulesChannelIdString,
          'max_presences': int? maxPresences,
          'max_members': int? maxMembers,
          'vanity_url_code': String? vanityUrlCode,
          'description': String? description,
          'banner': String? banner,
          'premium_tier': int premiumTier,
          'premium_subscription_count': int? premiumSubscriptionCount,
          'preferred_locale': String preferredLocale,
          'public_updates_channel_id': String? publicUpdatesChannelIdString,
          'max_video_channel_users': int? maxVideoChannelUsers,
          'max_stage_video_channel_users': int? maxStageVideoChannelUsers,
          'approximate_member_count': int? approximateMemberCount,
          'approximate_presence_count': int? approximatePresenceCount,
          'welcome_screen': JsonMap? welcomeScreenJsonMap,
          'nsfw_level': int nsfwLevel,
          'stickers': JsonList stickersJsonList,
          'premium_progress_bar_enabled': bool premiumProgressBarEnabled,
          'safety_alerts_channel_id': String? safetyAlertsChannelIdString,
        }) {
      return Guild._(
        Snowflake.fromJson(idString),
        name,
        icon,
        iconHash,
        splash,
        discoverySplash,
        owner,
        Snowflake.fromJson(ownerIdString),
        permissions,
        region,
        afkChannelIdString == null
            ? null
            : Snowflake.fromJson(afkChannelIdString),
        afkTimeout,
        widgetEnabled,
        widgetChannelIdString == null
            ? null
            : Snowflake.fromJson(widgetChannelIdString),
        verificationLevel,
        defaultMessageNotifications,
        explicitContentFilter,
        List<Role>.from(rolesJsonList),
        List<Emoji>.from(emojisJsonList),
        List<String>.from(featuresJsonList),
        mfaLevel,
        applicationIdString == null
            ? null
            : Snowflake.fromJson(applicationIdString),
        systemChannelIdString == null
            ? null
            : Snowflake.fromJson(systemChannelIdString),
        systemChannelFlags,
        rulesChannelIdString == null
            ? null
            : Snowflake.fromJson(rulesChannelIdString),
        maxPresences,
        maxMembers,
        vanityUrlCode,
        description,
        banner,
        premiumTier,
        premiumSubscriptionCount,
        preferredLocale,
        publicUpdatesChannelIdString == null
            ? null
            : Snowflake.fromJson(publicUpdatesChannelIdString),
        maxVideoChannelUsers,
        maxStageVideoChannelUsers,
        approximateMemberCount,
        approximatePresenceCount,
        welcomeScreenJsonMap == null
            ? null
            : WelcomeScreen.fromJson(welcomeScreenJsonMap),
        nsfwLevel,
        List<Sticker>.from(stickersJsonList),
        premiumProgressBarEnabled,
        safetyAlertsChannelIdString == null
            ? null
            : Snowflake.fromJson(safetyAlertsChannelIdString),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': Snowflake,
          'name': String,
          'icon': String?,
          'icon_hash': String?,
          'splash': String?,
          'discovery_splash': String?,
          'owner': bool?,
          'owner_id': Snowflake,
          'permissions': String?,
          'region': String?,
          'afk_channel_id': Snowflake?,
          'afk_timeout': int,
          'widget_enabled': bool?,
          'widget_channel_id': Snowflake?,
          'verification_level': int,
          'default_message_notifications': int,
          'explicit_content_filter': int,
          'roles': List<Role>,
          'emojis': List<Emoji>,
          'features': List<String>,
          'mfa_level': int,
          'application_id': Snowflake?,
          'system_channel_id': Snowflake?,
          'system_channel_flags': int,
          'rules_channel_id': Snowflake?,
          'max_presences': int?,
          'max_members': int?,
          'vanity_url_code': String?,
          'description': String?,
          'banner': String?,
          'premium_tier': int,
          'premium_subscription_count': int?,
          'preferred_locale': String,
          'public_updates_channel_id': Snowflake?,
          'max_video_channel_users': int?,
          'max_stage_video_channel_users': int?,
          'approximate_member_count': int?,
          'approximate_presence_count': int?,
          'welcome_screen': WelcomeScreen?,
          'nsfw_level': int,
          'stickers': List<Sticker>,
          'premium_progress_bar_enabled': bool,
          'safety_alerts_channel_id': Snowflake?,
        }
      ''', json);
    }
  }
}
