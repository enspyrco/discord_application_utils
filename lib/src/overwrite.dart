import 'package:discord_application_utils/src/snowflake.dart';
import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/channel#overwrite-object
//
// See permissions for more information about the allow and deny fields.
//   - https://discord.com/developers/docs/topics/permissions#permissions
class Overwrite {
  Overwrite._(
    this.id,
    this.type,
    this.allow,
    this.deny,
  );

  // role or user id
  final Snowflake id;

  // either 0 (role) or 1 (member)
  final int type;

  // permission bit set
  final String allow;

  // permission bit set
  final String deny;

  factory Overwrite.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'type': int type,
          'allow': String allow,
          'deny': String deny,
        }) {
      return Overwrite._(
        Snowflake.fromJson(idString),
        type,
        allow,
        deny,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'type': int,
        'allow': String,
        'deny': String,
      }, json);
    }
  }
}
