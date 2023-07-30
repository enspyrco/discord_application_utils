import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';
import '../user.dart';

// https://discord.com/developers/docs/resources/emoji#emoji-object-emoji-structure
final class Emoji {
  const Emoji._(
    this.id,
    this.name,
    this.roles,
    this.user,
    this.requireColons,
    this.managed,
    this.animated,
    this.available,
  );

  // emoji id
  final Snowflake id;

  // emoji name
  // can be null only in reaction emoji objects
  final String? name;

  // roles allowed to use this emoji
  final List<Snowflake> roles;

  // user that created this emoji
  final User? user;

  // whether this emoji must be wrapped in colons
  final bool? requireColons;

  // whether this emoji is managed
  final bool? managed;

  // whether this emoji is animated
  final bool? animated;

  // whether this emoji can be used, may be false due to loss of Server Boosts
  final bool? available;

  factory Emoji.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String? name,
          'roles': JsonList? rolesJsonList,
          'user': User? user,
          'require_colons': bool? requireColons,
          'managed': bool? managed,
          'animated': bool? animated,
          'available': bool? available,
        }) {
      return Emoji._(
        Snowflake.fromJson(idString),
        name,
        rolesJsonList == null ? [] : List<Snowflake>.from(rolesJsonList),
        user,
        requireColons,
        managed,
        animated,
        available,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': String,
          'name': String?,
          'roles': JsonList,
          'user': JsonMap?,
          'require_colons': bool?,
          'managed': bool?,
          'animated': bool?,
          'available': bool?,
        }
      ''', json);
    }
  }
}
