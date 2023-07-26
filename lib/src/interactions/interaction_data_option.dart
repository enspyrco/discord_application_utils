// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-application-command-interaction-data-option-structure
import 'package:json_utils/json_utils.dart';

class InteractionDataOption {
  InteractionDataOption._(
    this.name,
    this.type,
    this.value,
    this.options,
    this.focused,
  );

  // Name of the parameter
  final String name;

  // Value of application command option type
  final int type;

  // Value of the option resulting from user input
  // string, integer, double, or boolean
  final Object? value;

  // Present if this option is a group or subcommand
  final List<InteractionDataOption> options;

  // true if this option is the currently focused option for autocomplete
  final bool? focused;

  factory InteractionDataOption.fromJson(JsonMap json) {
    if (json
        case {
          'name': String name,
          'type': int type,
          'value': Object? value,
          'options': List<JsonMap>? options,
          'focused': bool? focused,
        }) {
      return InteractionDataOption._(
        name,
        type,
        value,
        (options ?? [])
            .map<InteractionDataOption>(
                (e) => InteractionDataOption.fromJson(e))
            .toList(),
        focused,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'name': String,
          'type': int,
          'value': Object?,
          'options': List<InteractionDataOption>?,
          'focused': bool?,
        }
      ''', json);
    }
  }
}
