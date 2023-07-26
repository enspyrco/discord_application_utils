import 'package:json_utils/json_utils.dart';

import '../default_reaction.dart';
import 'channel_type.dart';
import '../forum_tag.dart';
import '../overwrite.dart';
import '../snowflake.dart';
import '../thread_member.dart';
import '../thread_metadata.dart';
import '../user.dart';

// https://discord.com/developers/docs/resources/channel#channel-object
class Channel {
  Channel._(
    this.id,
    this.type,
    this.guildId,
    this.position,
    this.permissionOverwrites,
    this.name,
    this.topic,
    this.nsfw,
    this.lastMessageId,
    this.bitrate,
    this.userLimit,
    this.rateLimitPerUser,
    this.recipients,
    this.icon,
    this.ownerId,
    this.applicationId,
    this.managed,
    this.parentId,
    this.lastPinTimestamp,
    this.rtcRegion,
    this.videoQualityMode,
    this.messageCount,
    this.memberCount,
    this.threadMetadata,
    this.member,
    this.defaultAutoArchiveDuration,
    this.permissions,
    this.flags,
    this.totalMessageSent,
    this.availableTags,
    this.appliedTags,
    this.defaultReactionEmoji,
    this.defaultThreadRateLimitPerUser,
    this.defaultSortOrder,
    this.defaultForumLayout,
  );

  // the id of this channel
  final Snowflake id;

  // the type of channel
  final ChannelType type;

  // the id of the guild (may be missing for some channel objects received over gateway guild dispatches)
  final Snowflake? guildId;

  // sorting position of the channel
  final int? position;

  // explicit permission overwrites for members and roles
  final List<Overwrite>? permissionOverwrites;

  // the name of the channel (1-100 characters)
  final String? name;

  // the channel topic (0-4096 characters for GUILD_FORUM channels, 0-1024 characters for all others)
  final String? topic;

  // whether the channel is nsfw
  final bool? nsfw;

  // the id of the last message sent in this channel (or thread for GUILD_FORUM channels) (may not point to an existing or valid message or thread)
  final Snowflake? lastMessageId;

  // the bitrate (in bits) of the voice channel
  final int? bitrate;

  // the user limit of the voice channel
  final int? userLimit;

  // amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
  // rate_limit_per_user also applies to thread creation. Users can send one message and create one thread during each rate_limit_per_user interval.
  final int? rateLimitPerUser;

  // the recipients of the DM
  final List<User>? recipients;

  // icon hash of the group DM
  final String? icon;

  // id of the creator of the group DM or thread
  final Snowflake? ownerId;

  // application id of the group DM creator if it is bot-created
  final Snowflake? applicationId;

  // for group DM channels: whether the channel is managed by an application via the gdm.join OAuth2 scope
  final bool? managed;

  // for guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created
  final Snowflake? parentId;

  // when the last pinned message was pinned. This may be null in events such as GUILD_CREATE when a message is not pinned.
  // ?ISO8601 timestamp
  final String? lastPinTimestamp;

  // voice region id for the voice channel, automatic when set to null
  final String? rtcRegion;

  // the camera video quality mode of the voice channel, 1 when not present
  final int? videoQualityMode;

  // number of messages (not including the initial message or deleted messages) in a thread.
  // For threads created before July 1, 2022, the message count is inaccurate when it's greater than 50.
  final int? messageCount;

  // an approximate count of users in a thread, stops counting at 50
  final int? memberCount;

  // thread-specific fields not needed by other channels
  final ThreadMetadata? threadMetadata;

  // thread member object for the current user, if they have joined the thread, only included on certain API endpoints
  final ThreadMember? member;

  // default duration, copied onto newly created threads, in minutes, threads will stop showing in the channel list after the specified period of inactivity, can be set to: 60, 1440, 4320, 10080
  final int? defaultAutoArchiveDuration;

  // computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction
  final String? permissions;

  // channel flags combined as a bitfield
  final int? flags;

  // number of messages ever sent in a thread, it's similar to message_count on message creation, but will not decrement the number when a message is deleted
  final int? totalMessageSent;

  // the set of tags that can be used in a GUILD_FORUM channel
  final List<ForumTag>? availableTags;

  // the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel
  final List<Snowflake>? appliedTags;

  // the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
  final DefaultReaction? defaultReactionEmoji;

  // integer	the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update.
  final int? defaultThreadRateLimitPerUser;

  // the default sort order type used to order posts in GUILD_FORUM channels. Defaults to null, which indicates a preferred sort order hasn't been set by a channel admin
  final int? defaultSortOrder;

  // the default forum layout view used to display posts in GUILD_FORUM channels. Defaults to 0, which indicates a layout view has not been set by a channel admin
  final int? defaultForumLayout;

  factory Channel.fromJson(JsonMap json) {
    if (json
        case {
          'id': String id,
          'type': int type,
        }) {
      var (
        String? guildId,
        int? position,
        JsonList? permissionOverwrites,
        String? name,
        String? topic,
        bool? nsfw,
        String? lastMessageId,
        int? bitrate,
        int? userLimit,
        int? rateLimitPerUser,
        JsonList? recipients,
        String? icon,
        String? ownerId,
        String? applicationId,
        bool? managed,
        String? parentId,
        String? lastPinTimestamp,
        String? rtcRegion,
        int? videoQualityMode,
        int? messageCount,
        int? memberCount,
        JsonMap? threadMetadata,
        JsonMap? member,
        int? defaultAutoArchiveDuration,
        String? permissions,
        int? flags,
        int? totalMessageSent,
        JsonList? availableTags,
        JsonList? appliedTags,
        JsonMap? defaultReactionEmoji,
        int? defaultThreadRateLimitPerUser,
        int? defaultSortOrder,
        int? defaultForumLayout,
      ) = (
        json['guild_id'] as String?,
        json['position'] as int?,
        json['permission_overwrites'] as JsonList?,
        json['name'] as String?,
        json['topic'] as String?,
        json['nsfw'] as bool?,
        json['lastMessage_id'] as String?,
        json['bitrate'] as int?,
        json['user_limit'] as int?,
        json['rate_limit_per_user'] as int?,
        json['recipients'] as JsonList?,
        json['icon'] as String?,
        json['owner_id'] as String?,
        json['application_id'] as String?,
        json['managed'] as bool?,
        json['parent_id'] as String?,
        json['last_pin_timestamp'] as String?,
        json['rtc_region'] as String?,
        json['video_quality_mode'] as int?,
        json['message_count'] as int?,
        json['member_count'] as int?,
        json['thread_metadata'] as JsonMap?,
        json['member'] as JsonMap?,
        json['default_auto_archive_duration'] as int?,
        json['permissions'] as String?,
        json['flags'] as int?,
        json['total_message_sent'] as int?,
        json['available_tags'] as JsonList?,
        json['applied_tags'] as JsonList?,
        json['default_reaction_emoji'] as JsonMap?,
        json['default_thread_rate_limit_per_user'] as int?,
        json['default_sort_order'] as int?,
        json['default_forum_layout'] as int?,
      );
      return Channel._(
        Snowflake.fromJson(id),
        ChannelType.fromInt(type),
        guildId == null ? null : Snowflake.fromJson(guildId),
        position,
        permissionOverwrites == null
            ? null
            : List<Overwrite>.from(permissionOverwrites),
        name,
        topic,
        nsfw,
        lastMessageId == null ? null : Snowflake.fromJson(lastMessageId),
        bitrate,
        userLimit,
        rateLimitPerUser,
        recipients == null ? null : List<User>.from(recipients),
        icon,
        ownerId == null ? null : Snowflake.fromJson(ownerId),
        applicationId == null ? null : Snowflake.fromJson(applicationId),
        managed,
        parentId == null ? null : Snowflake.fromJson(parentId),
        lastPinTimestamp,
        rtcRegion,
        videoQualityMode,
        messageCount,
        memberCount,
        threadMetadata == null ? null : ThreadMetadata.fromJson(threadMetadata),
        member == null ? null : ThreadMember.fromJson(member),
        defaultAutoArchiveDuration,
        permissions,
        flags,
        totalMessageSent,
        availableTags == null ? null : List<ForumTag>.from(availableTags),
        appliedTags == null ? null : List<Snowflake>.from(appliedTags),
        defaultReactionEmoji == null
            ? null
            : DefaultReaction.fromJson(defaultReactionEmoji),
        defaultThreadRateLimitPerUser,
        defaultSortOrder,
        defaultForumLayout,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'type': int,
        'guild_id': Nullable<String>,
        'position': Nullable<int>,
        'permission_overwrites': List<String>,
        'name': Nullable<String>,
        'topic': Nullable<String>,
        'nsfw': Nullable<bool>,
        'last_message_id': Nullable<String>,
        'bitrate': Nullable<int>,
        'user_limit': Nullable<int>,
        'rate_limit_per_user': Nullable<int>,
        'recipients': List<JsonMap>,
        'icon': Nullable<String>,
        'owner_id': Nullable<String>,
        'application_id': Nullable<String>,
        'managed': Nullable<bool>,
        'parent_id': Nullable<String>,
        'last_pin_timestamp': Nullable<String>,
        'rtc_region': Nullable<String>,
        'video_quality_mode': Nullable<int>,
        'message_count': Nullable<int>,
        'member_count': Nullable<int>,
        'thread_metadata': Nullable<JsonMap>,
        'member': Nullable<JsonMap>,
        'default_auto_archive_duration': Nullable<int>,
        'permissions': Nullable<String>,
        'flags': Nullable<int>,
        'total_message_sent': Nullable<int>,
        'available_tags': JsonList,
        'applied_tags': JsonList,
        'default_reaction_emoji': Nullable<JsonMap>,
        'default_thread_rate_limit_per_user': Nullable<int>,
        'default_sort_order': Nullable<int>,
        'default_forum_layout': Nullable<int>,
      }, json);
    }
  }
}
