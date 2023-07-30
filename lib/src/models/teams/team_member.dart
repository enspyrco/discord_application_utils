import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';
import '../user.dart';

// https://discord.com/developers/docs/topics/teams#data-models-team-member-object
final class TeamMember {
  const TeamMember._(
    this.membershipState,
    this.permissions,
    this.teamId,
    this.user,
  );
  // the user's membership state on the team
  final int membershipState;

  // will always be ["*"]
  final List<String> permissions;

  // the id of the parent team of which they are a member
  final Snowflake teamId;

  // the avatar, discriminator, id, and username of the user
  final User user;

  factory TeamMember.fromJson(JsonMap json) {
    if (json
        case {
          'membership_state': int membershipState,
          'permissions': JsonList permissions,
          'team_id': String teamIdString,
          'user': JsonMap userJsonMap,
        }) {
      return TeamMember._(
        membershipState,
        List<String>.from(permissions),
        Snowflake.fromJson(teamIdString),
        User.fromJson(userJsonMap),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'membership_state': int,
          'permissions': List<String>,
          'team_id': String,
          'user': JsonMap,
        }
      ''', json);
    }
  }
}
