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
    this.user_limit,
    this.rate_limit_per_user,
    this.recipients,
    this.icon,
    this.ownerId,
    this.applicationId,
    this.managed,
    this.parentId,
    this.lastPinTimestamp,
    this.rtcRegion,
    this.video_quality_mode,
    this.message_count,
    this.member_count,
    this.thread_metadata,
    this.member,
    this.default_auto_archive_duration,
    this.permissions,
    this.flags,
    this.total_message_sent,
    this.available_tags,
    this.applied_tags,
    this.default_reaction_emoji,
    this.default_thread_rate_limit_per_user,
    this.default_sort_order,
    this.default_forum_layout,
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
  final List<Overwrite> permissionOverwrites;

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
  final int? user_limit;

  // amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
  // rate_limit_per_user also applies to thread creation. Users can send one message and create one thread during each rate_limit_per_user interval.
  final int? rate_limit_per_user;

  // the recipients of the DM
  final List<User> recipients;

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
  final int? video_quality_mode;

  // number of messages (not including the initial message or deleted messages) in a thread.
  // For threads created before July 1, 2022, the message count is inaccurate when it's greater than 50.
  final int? message_count;

  // an approximate count of users in a thread, stops counting at 50
  final int? member_count;

  // thread-specific fields not needed by other channels
  final ThreadMetadata? thread_metadata;

  // thread member object for the current user, if they have joined the thread, only included on certain API endpoints
  final ThreadMember? member;

  // default duration, copied onto newly created threads, in minutes, threads will stop showing in the channel list after the specified period of inactivity, can be set to: 60, 1440, 4320, 10080
  final int? default_auto_archive_duration;

  // computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction
  final String? permissions;

  // channel flags combined as a bitfield
  final int? flags;

  // number of messages ever sent in a thread, it's similar to message_count on message creation, but will not decrement the number when a message is deleted
  final int? total_message_sent;

  // the set of tags that can be used in a GUILD_FORUM channel
  final List<ForumTag> available_tags;

  // the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel
  final List<Snowflake> applied_tags;

  // the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
  final DefaultReaction? default_reaction_emoji;

  // integer	the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update.
  final int? default_thread_rate_limit_per_user;

  // the default sort order type used to order posts in GUILD_FORUM channels. Defaults to null, which indicates a preferred sort order hasn't been set by a channel admin
  final int? default_sort_order;

  // the default forum layout view used to display posts in GUILD_FORUM channels. Defaults to 0, which indicates a layout view has not been set by a channel admin
  final int? default_forum_layout;

  factory Channel.fromJson(JsonMap json) {
    if (json
        case {
          'id': Snowflake id,
          'type': ChannelType type,
          'guildId': Snowflake? guildId,
          'position': int? position,
          'permissionOverwrites': List<Overwrite> permissionOverwrites,
          'name': String? name,
          'topic': String? topic,
          'nsfw': bool? nsfw,
          'lastMessageId': Snowflake? lastMessageId,
          'bitrate': int? bitrate,
          'user_limit': int? user_limit,
          'rate_limit_per_user': int? rate_limit_per_user,
          'recipients': List<User> recipients,
          'icon': String? icon,
          'ownerId': Snowflake? ownerId,
          'applicationId': Snowflake? applicationId,
          'managed': bool? managed,
          'parentId': Snowflake? parentId,
          'lastPinTimestamp': String? lastPinTimestamp,
          'rtcRegion': String? rtcRegion,
          'video_quality_mode': int? video_quality_mode,
          'message_count': int? message_count,
          'member_count': int? member_count,
          'thread_metadata': ThreadMetadata? thread_metadata,
          'member': ThreadMember? member,
          'default_auto_archive_duration': int? default_auto_archive_duration,
          'permissions': String? permissions,
          'flags': int? flags,
          'total_message_sent': int? total_message_sent,
          'available_tags': JsonList available_tags,
          'applied_tags': JsonList applied_tags,
          'default_reaction_emoji': DefaultReaction? default_reaction_emoji,
          'default_thread_rate_limit_per_user': int?
              default_thread_rate_limit_per_user,
          'default_sort_order': int? default_sort_order,
          'default_forum_layout': int? default_forum_layout,
        }) {
      return Channel._(
        id,
        type,
        guildId,
        position,
        permissionOverwrites,
        name,
        topic,
        nsfw,
        lastMessageId,
        bitrate,
        user_limit,
        rate_limit_per_user,
        recipients,
        icon,
        ownerId,
        applicationId,
        managed,
        parentId,
        lastPinTimestamp,
        rtcRegion,
        video_quality_mode,
        message_count,
        member_count,
        thread_metadata,
        member,
        default_auto_archive_duration,
        permissions,
        flags,
        total_message_sent,
        List<ForumTag>.from(available_tags),
        List<Snowflake>.from(applied_tags),
        default_reaction_emoji,
        default_thread_rate_limit_per_user,
        default_sort_order,
        default_forum_layout,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': Snowflake,
          'type': ChannelType,
          'guildId': Snowflake?,
          'position': int?,
          'permissionOverwrites': List<Overwrite>,
          'name': String?,
          'topic': String?,
          'nsfw': bool?,
          'lastMessageId': Snowflake?,
          'bitrate': int?,
          'user_limit': int?,
          'rate_limit_per_user': int?,
          'recipients': List<User>,
          'icon': String?,
          'ownerId': Snowflake?,
          'applicationId': Snowflake?,
          'managed': bool?,
          'parentId': Snowflake?,
          'lastPinTimestamp': String?,
          'rtcRegion': String?,
          'video_quality_mode': int?,
          'message_count': int?,
          'member_count': int?,
          'thread_metadata': ThreadMetadata?,
          'member': ThreadMember?,
          'default_auto_archive_duration': int?,
          'permissions': String?,
          'flags': int?,
          'total_message_sent': int?,
          'available_tags': JsonList,
          'applied_tags': JsonList,
          'default_reaction_emoji': DefaultReaction?,
          'default_thread_rate_limit_per_user': int?,
          'default_sort_order': int?,
          'default_forum_layout': int?,
        }
      ''', json);
    }
  }
}
