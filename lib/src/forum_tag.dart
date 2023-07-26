import 'package:json_utils/json_utils.dart';

import 'snowflake.dart';

// https://discord.com/developers/docs/resources/channel#forum-tag-object
class ForumTag {
  ForumTag._(
    this.id,
    this.name,
    this.moderated,
    this.snowflake,
    this.emojiName,
  );

  // the id of the tag
  final Snowflake id;

  // the name of the tag (0-20 characters)
  final String name;

  // whether this tag can only be added to or removed from threads by a member with the MANAGE_THREADS permission
  final bool moderated;

  // the id of a guild's custom emoji
  // At most one of emoji_id and emoji_name may be set to a non-null value.
  final Snowflake? snowflake;

  // the unicode character of the emoji
  // At most one of emoji_id and emoji_name may be set to a non-null value.
  final String? emojiName;

  factory ForumTag.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String name,
          'moderated': bool moderated,
          'snowflake': String? snowflakeString,
          'emoji_name': String? emojiName,
        }) {
      return ForumTag._(
        Snowflake.fromJson(idString),
        name,
        moderated,
        snowflakeString == null ? null : Snowflake.fromJson(snowflakeString),
        emojiName,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': Snowflake,
          'name': String,
          'moderated': bool,
          'snowflake': Snowflake?,
          'emoji_name': String?,
        }
      ''', json);
    }
  }
}
