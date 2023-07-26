import 'package:discord_application_utils/src/snowflake.dart';
import 'package:json_utils/json_utils.dart';

class DefaultReaction {
  DefaultReaction._(
    this.emojiId,
    this.emojiName,
  );

  // the id of a guild's custom emoji
  final Snowflake? emojiId;

  // the unicode character of the emoji
  final String? emojiName;

  factory DefaultReaction.fromJson(JsonMap json) {
    if (json
        case {
          'emoji_id': String? emojiIdString,
          'emoji_name': String? emojiName,
        }) {
      return DefaultReaction._(
        emojiIdString == null ? null : Snowflake.fromJson(emojiIdString),
        emojiName,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'emoji_id': String?,
          'emoji_name': String?,
        }
      ''', json);
    }
  }
}
