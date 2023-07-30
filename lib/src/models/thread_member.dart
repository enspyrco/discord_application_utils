import 'package:json_utils/json_utils.dart';

import 'guild_member.dart';
import 'snowflake.dart';

// https://discord.com/developers/docs/resources/channel#thread-member-object-thread-member-structure
class ThreadMember {
  ThreadMember._(
    this.id,
    this.userId,
    this.joinTimestamp,
    this.flags,
    this.member,
  );
  // ID of the thread
  // These fields are omitted on the member sent within each thread in the GUILD_CREATE event.
  final Snowflake? id;

  // ID of the user
  // These fields are omitted on the member sent within each thread in the GUILD_CREATE event.
  final Snowflake? userId;

  // Time the user last joined the thread
  // ISO8601 timestamp
  final String joinTimestamp;

  // Any user-thread settings, currently only used for notifications
  final int flags;

  // Additional information about the user
  // These fields are omitted on the member sent within each thread in the GUILD_CREATE event.
  // The member field is only present when with_member is set to true when calling List Thread Members or Get Thread Member.
  final GuildMember? member;

  factory ThreadMember.fromJson(JsonMap json) {
    if (json
        case {
          'id': String? idString,
          'user_id': String? userIdString,
          'join_timestamp': String joinTimestamp,
          'flags': int flags,
          'member': JsonMap? memberJsonMap,
        }) {
      return ThreadMember._(
        idString == null ? null : Snowflake.fromJson(idString),
        userIdString == null ? null : Snowflake.fromJson(userIdString),
        joinTimestamp,
        flags,
        memberJsonMap == null ? null : GuildMember.fromJson(memberJsonMap),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': String?,
          'user_id': String?,
          'join_timestamp': String,
          'flags': int,
          'member': JsonMap?,
        }
      ''', json);
    }
  }
}
