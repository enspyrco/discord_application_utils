import 'package:discord_application_utils/src/snowflake.dart';
import 'package:json_utils/json_utils.dart';

import 'team_member.dart';

// https://discord.com/developers/docs/topics/teams#data-models-team-object
final class Team {
  const Team._(
    this.icon,
    this.id,
    this.members,
    this.name,
    this.ownerUserId,
  );

  // a hash of the image of the team's icon
  final String? icon;

  // the unique id of the team
  final Snowflake id;

  // the members of the team
  final List<TeamMember> members;

  // the name of the team
  final String name;

  // the user id of the current team owner
  final Snowflake ownerUserId;

  factory Team.fromJson(JsonMap json) {
    if (json
        case {
          'icon': String? icon,
          'id': Snowflake id,
          'members': JsonList members,
          'name': String name,
          'owner_user_id': String ownerUserIdString,
        }) {
      return Team._(
        icon,
        id,
        List<TeamMember>.from(members),
        name,
        Snowflake.fromJson(ownerUserIdString),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'icon': String?,
          'id': Snowflake,
          'members': List<TeamMember>,
          'name': String,
          'owner_user_id': Snowflake,
        }
      ''', json);
    }
  }
}
