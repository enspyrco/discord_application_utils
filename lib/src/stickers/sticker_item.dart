import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';

// https://discord.com/developers/docs/resources/sticker#sticker-item-object
final class StickerItem {
  StickerItem._(
    this.id,
    this.name,
    this.formatType,
  );

  // id of the sticker
  final Snowflake id;

  // name of the sticker
  final String name;

  // type of sticker format
  final int formatType;

  factory StickerItem.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String name,
          'format_type': int formatType,
        }) {
      return StickerItem._(
        Snowflake.fromJson(idString),
        name,
        formatType,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'name': String,
        'format_type': int,
      }, json);
    }
  }
}
