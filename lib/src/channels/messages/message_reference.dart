import 'package:json_utils/json_utils.dart';

import '../../snowflake.dart';

// https://discord.com/developers/docs/resources/channel#message-reference-object-message-reference-structure
final class MessageReference {
  MessageReference._(
    this.messageId,
    this.channelId,
    this.guildId,
    this.failIfNotExists,
  );

  // id of the originating message
  final Snowflake? messageId;

  // id of the originating message's channel
  // channel_id is optional when creating a reply, but will always be present when receiving an event/response that includes this data model.
  final Snowflake? channelId;

  // id of the originating message's guild
  final Snowflake guildId;

  // when sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default true
  final bool? failIfNotExists;

  factory MessageReference.fromJson(JsonMap json) {
    if (json
        case {
          'message_id': String? messageIdString,
          'channel_id': String? channelIdString,
          'guild_id': String guildIdString,
          'fail_if_not_exists': bool? failIfNotExists,
        }) {
      return MessageReference._(
        messageIdString == null ? null : Snowflake.fromJson(messageIdString),
        channelIdString == null ? null : Snowflake.fromJson(channelIdString),
        Snowflake.fromJson(guildIdString),
        failIfNotExists,
      );
    } else {
      throw MalformedJsonMapException({
        'message_id': Nullable<String>,
        'channel_id': Nullable<String>,
        'guild_id': String,
        'fail_if_not_exists': Nullable<bool>,
      }, json);
    }
  }
}
