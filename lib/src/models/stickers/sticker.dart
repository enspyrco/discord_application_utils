import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';
import '../user.dart';

// https://discord.com/developers/docs/resources/sticker#sticker-object
final class Sticker {
  const Sticker._(
    this.id,
    this.packId,
    this.name,
    this.description,
    this.tags,
    this.asset,
    this.type,
    this.formatType,
    this.available,
    this.guildId,
    this.user,
    this.sortValue,
  );

  // id of the sticker
  final Snowflake id;

  // for standard stickers, id of the pack the sticker is from
  final Snowflake? packId;

  // name of the sticker
  final String name;

  // description of the sticker
  final String? description;

  // autocomplete/suggestion tags for the sticker (max 200 characters)
  // A comma separated list of keywords is the format used in this field by standard stickers, but this is just a convention. Incidentally the client will always use a name generated from an emoji as the value of this field when creating or modifying a guild sticker.
  final String tags;

  // Deprecated previously the sticker asset hash, now an empty string
  final String? asset;

  // type of sticker
  final int type;

  // type of sticker format
  final int formatType;

  // whether this guild sticker can be used, may be false due to loss of Server Boosts
  final bool? available;

  // id of the guild that owns this sticker
  final Snowflake? guildId;

  // the user that uploaded the guild sticker
  final User? user;

  // the standard sticker's sort order within its pack
  final int? sortValue;

  factory Sticker.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'pack_id': String? packIdString,
          'name': String name,
          'description': String? description,
          'tags': String tags,
          'asset': String? asset,
          'type': int type,
          'format_type': int formatType,
          'available': bool? available,
          'guild_id': String? guildIdString,
          'user': JsonMap? userJsonMap,
          'sort_value': int? sortValue,
        }) {
      return Sticker._(
        Snowflake.fromJson(idString),
        packIdString == null ? null : Snowflake.fromJson(packIdString),
        name,
        description,
        tags,
        asset,
        type,
        formatType,
        available,
        guildIdString == null ? null : Snowflake.fromJson(guildIdString),
        userJsonMap == null ? null : User.fromJson(userJsonMap),
        sortValue,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': String,
          'pack_id': String?,
          'name': String,
          'description': String?,
          'tags': String,
          'asset': String?,
          'type': int,
          'format_type': int,
          'available': bool?,
          'guild_id': String?,
          'user': JsonMap?,
          'sort_value': int?,
        }
      ''', json);
    }
  }
}
