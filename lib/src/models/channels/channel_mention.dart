import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';

// https://discord.com/developers/docs/resources/channel#channel-mention-object-channel-mention-structure
final class ChannelMention {
  const ChannelMention._(
    this.id,
    this.guild_id,
    this.type,
    this.name,
  );

  // id of the channel
  final Snowflake id;

  // id of the guild containing the channel
  final Snowflake guild_id;

  // the type of channel
  final int type;

  // the name of the channel
  final String name;

  factory ChannelMention.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'guild_id': String guildIdString,
          'type': int type,
          'name': String name,
        }) {
      return ChannelMention._(
        Snowflake.fromJson(idString),
        Snowflake.fromJson(guildIdString),
        type,
        name,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': String,
          'guild_id': String,
          'type': int,
          'name': String,
        }
      ''', json);
    }
  }
}
