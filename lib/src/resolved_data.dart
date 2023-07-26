import 'package:json_utils/json_utils.dart';

import '../discord_application_utils.dart';
import 'channels/attachment.dart';
import 'channels/channel.dart';
import 'guild_member.dart';
import 'role.dart';
import 'snowflake.dart';
import 'user.dart';

// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-resolved-data-structure
class ResolvedData {
  ResolvedData._(
    this.users,
    this.members,
    this.roles,
    this.channels,
    this.messages,
    this.attachments,
  );
  // the ids and User objects
  final Map<Snowflake, User>? users;

  // the ids and partial Member objects
  // Partial Member objects are missing user, deaf and mute fields
  final Map<Snowflake, GuildMember>? members;

  // the ids and Role objects
  final Map<Snowflake, Role>? roles;

  // the ids and partial Channel objects
  // Partial Channel objects only have id, name, type and permissions fields.
  // Threads will also have thread_metadata and parent_id fields.
  final Map<Snowflake, Channel>? channels;

  // the ids and partial Message objects
  final Map<Snowflake, Message>? messages;

  // the ids and attachment objects
  // Map of Snowflakes to attachment objects
  final Map<Snowflake, Attachment>? attachments;

  factory ResolvedData.fromJson(JsonMap json) {
    if (json
        case {
          'users': Map<String, JsonMap>? users,
          'members': Map<String, JsonMap>? members,
          'roles': Map<String, JsonMap>? roles,
          'channels': Map<String, JsonMap>? channels,
          'messages': Map<String, JsonMap>? messages,
          'attachments': Map<String, JsonMap>? attachments,
        }) {
      return ResolvedData._(
        users?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), User.fromJson(value)))),
        members?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), GuildMember.fromJson(value)))),
        roles?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), Role.fromJson(value)))),
        channels?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), Channel.fromJson(value)))),
        messages?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), Message.fromJson(value)))),
        attachments?.map((key, value) =>
            (MapEntry(Snowflake.fromJson(key), Attachment.fromJson(value)))),
      );
    } else {
      throw MalformedJsonMapException({
        'users': Nullable<Map<String, JsonMap>>,
        'members': Nullable<Map<String, JsonMap>>,
        'roles': Nullable<Map<String, JsonMap>>,
        'channels': Nullable<Map<String, JsonMap>>,
        'messages': Nullable<Map<String, JsonMap>>,
        'attachments': Nullable<Map<String, JsonMap>>,
      }, json);
    }
  }
}
