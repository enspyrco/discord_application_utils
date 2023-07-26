import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';

// https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-channel-structure
final class WelcomeScreenChannel {
  const WelcomeScreenChannel._(
    this.channelId,
    this.description,
    this.emojiId,
    this.emojiName,
  );
  // the channel's id
  final Snowflake channelId;

  // the description shown for the channel
  final String description;

  // the emoji id, if the emoji is custom
  final Snowflake? emojiId;

  // the emoji name if custom, the unicode character if standard, or null if no emoji is set
  final String? emojiName;

  factory WelcomeScreenChannel.fromJson(JsonMap json) {
    if (json
        case {
          'channel_id': String channelIdString,
          'description': String description,
          'emoji_id': String? emojiIdString,
          'emoji_name': String? emojiName,
        }) {
      return WelcomeScreenChannel._(
        Snowflake.fromJson(channelIdString),
        description,
        emojiIdString == null ? null : Snowflake.fromJson(emojiIdString),
        emojiName,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'channel_id': String,
          'description': String,
          'emoji_id': String?,
          'emoji_name': String?,
        }
      ''', json);
    }
  }
}
