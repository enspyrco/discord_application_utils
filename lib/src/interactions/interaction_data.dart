import 'package:json_utils/json_utils.dart';

import '../resolved_data.dart';
import 'interaction_data_option.dart';

// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-interaction-data
class InteractionData {
  InteractionData._(
    this.id,
    this.name,
    this.type,
    this.resolved,
    this.options,
    this.guildId,
    this.targetId,
  );

  // snowflake	the ID of the invoked command
  final String id;

  // the name of the invoked command
  final String name;

  // the type of the invoked command
  final int type;

  // resolved data	converted users + roles + channels + attachments
  final ResolvedData? resolved;

  // the params + values from the user
  // This can be partial when in response to APPLICATION_COMMAND_AUTOCOMPLETE
  final List<InteractionDataOption> options;

  // snowflake	the id of the guild the command is registered to
  final String? guildId;

  // snowflake	id of the user or message targeted by a user or message command
  final String? targetId;

  factory InteractionData.fromJson(JsonMap json) {
    if (json
        case {
          'id': String id,
          'name': String name,
          'type': int type,
        }) {
      var (
        JsonMap? resolved,
        JsonList? options,
        String? guildId,
        String? targetId
      ) = (
        json['resolved'] as JsonMap?,
        json['options'] as JsonList?,
        json['guildId'] as String?,
        json['targetId'] as String?,
      );
      return InteractionData._(
        id,
        name,
        type,
        resolved == null ? null : ResolvedData.fromJson(resolved),
        options == null
            ? []
            : options
                .map<InteractionDataOption>(
                    (e) => InteractionDataOption.fromJson(e as JsonMap))
                .toList(),
        guildId,
        targetId,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'name': String,
        'type': int,
        'resolved': Nullable<JsonMap>,
        'options': Nullable<JsonList>,
        'guildId': Nullable<String>,
        'targetId': Nullable<String>,
      }, json);
    }
  }
}
