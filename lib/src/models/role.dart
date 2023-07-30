import 'package:json_utils/json_utils.dart';

import 'role_tags.dart';
import 'snowflake.dart';

// https://discord.com/developers/docs/topics/permissions#role-object
final class Role {
  Role._(
    this.id,
    this.name,
    this.color,
    this.hoist,
    this.icon,
    this.unicodeEmoji,
    this.position,
    this.permissions,
    this.managed,
    this.mentionable,
    this.tags,
    this.flags,
  );

  // role id
  final Snowflake id;

  // role name
  final String name;

  // integer representation of hexadecimal color code
  final int color;

  // if this role is pinned in the user listing
  final bool hoist;

  // role icon hash
  final String? icon;

  // role unicode emoji
  final String? unicodeEmoji;

  // position of this role
  final int position;

  // permission bit set
  final String permissions;

  // whether this role is managed by an integration
  final bool managed;

  // whether this role is mentionable
  final bool mentionable;

  // the tags this role has
  final RoleTags tags;

  // role flags combined as a bitfield
  final int flags;

  factory Role.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String name,
          'color': int color,
          'hoist': bool hoist,
          'icon': String? icon,
          'unicode_emoji': String? unicodeEmoji,
          'position': int position,
          'permissions': String permissions,
          'managed': bool managed,
          'mentionable': bool mentionable,
          'tags': JsonMap tagsJsonMap,
          'flags': int flags,
        }) {
      return Role._(
        Snowflake.fromJson(idString),
        name,
        color,
        hoist,
        icon,
        unicodeEmoji,
        position,
        permissions,
        managed,
        mentionable,
        RoleTags.fromJson(tagsJsonMap),
        flags,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'name': String,
        'color': int,
        'hoist': bool,
        'icon': Nullable<String>,
        'unicode_emoji': Nullable<String>,
        'position': int,
        'permissions': String,
        'managed': bool,
        'mentionable': bool,
        'tags': JsonMap,
        'flags': int,
      }, json);
    }
  }
}
