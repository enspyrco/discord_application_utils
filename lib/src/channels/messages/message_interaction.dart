import 'package:json_utils/json_utils.dart';

import '../../guild_member.dart';
import '../../interactions/interaction_type.dart';
import '../../snowflake.dart';
import '../../user.dart';

// https://discord.com/developers/docs/interactions/receiving-and-responding#message-interaction-object-message-interaction-structure
final class MessageInteraction {
  MessageInteraction._(
    this.id,
    this.type,
    this.name,
    this.user,
    this.member,
  );

  // ID of the interaction
  final Snowflake id;

  // Type of interaction
  final InteractionType type;

  // Name of the application command, including subcommands and subcommand groups
  final String name;

  // User who invoked the interaction
  final User user;

  // Member who invoked the interaction in the guild
  final GuildMember? member;

  factory MessageInteraction.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'type': int typeInt,
          'name': String name,
          'user': JsonMap userJsonMap,
          'member': JsonMap? memberJsonMap,
        }) {
      return MessageInteraction._(
        Snowflake.fromJson(idString),
        InteractionType.fromInt(typeInt),
        name,
        User.fromJson(userJsonMap),
        memberJsonMap == null ? null : GuildMember.fromJson(memberJsonMap),
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'type': int,
        'name': String,
        'user': JsonMap,
        'member': Nullable<JsonMap>,
      }, json);
    }
  }
}
