import 'package:json_utils/json_utils.dart';

import 'role.dart';
import 'user.dart';

// https://discord.com/developers/docs/resources/guild#guild-member-object-guild-member-structure
class GuildMember {
  GuildMember._(
    this.user,
    this.nick,
    this.avatar,
    this.roles,
    this.joinedAt,
    this.premiumSince,
    this.deaf,
    this.mute,
    this.flags,
    this.pending,
    this.permissions,
    this.communicationDisabledUntil,
  );
  // object	the user this guild member represents
  final User? user;

  // this user's guild nickname
  final String? nick;

  // the member's guild avatar hash
  final String? avatar;

  // array of role object ids
  final List<Role> roles;

  // when the user joined the guild
  final DateTime joinedAt;

  // when the user started boosting the guild
  final DateTime? premiumSince;

  // whether the user is deafened in voice channels
  final bool deaf;

  // whether the user is muted in voice channels
  final bool mute;

  // guild member flags represented as a bit set, defaults to 0
  final int flags;

  // whether the user has not yet passed the guild's Membership Screening requirements
  final bool? pending;

  // total permissions of the member in the channel, including overwrites, returned when in the interaction object
  final String? permissions;

  // when the user's timeout will expire and the user will be able to communicate in the guild again, null or a time in the past if the user is not timed out
  final DateTime? communicationDisabledUntil;

  factory GuildMember.fromJson(JsonMap json) {
    if (json
        case {
          'user': JsonMap? userJson,
          'nick': String? nick,
          'avatar': String? avatar,
          'roles': JsonList rolesJsonList,
          'joined_at': String joinedAtString,
          'premium_since': String? premiumSinceString,
          'deaf': bool deaf,
          'mute': bool mute,
          'flags': int flags,
          'pending': bool? pending,
          'permissions': String? permissions,
          'communication_disabled_until': String?
              communicationDisabledUntilString,
        }) {
      return GuildMember._(
        userJson == null ? null : User.fromJson(userJson),
        nick,
        avatar,
        List<Role>.from(rolesJsonList),
        DateTime.parse(joinedAtString),
        premiumSinceString == null ? null : DateTime.parse(premiumSinceString),
        deaf,
        mute,
        flags,
        pending,
        permissions,
        communicationDisabledUntilString == null
            ? null
            : DateTime.parse(communicationDisabledUntilString),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'user': JsonMap?,
          'nick': String?,
          'avatar': String?,
          'roles': JsonList,
          'joined_at': String,
          'premium_since': String?,
          'deaf': bool,
          'mute': bool,
          'flags': int,
          'pending': bool?,
          'permissions': String?,
          'communication_disabled_until': String?,
        }
      ''', json);
    }
  }
}
