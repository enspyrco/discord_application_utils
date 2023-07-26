import 'package:json_utils/json_utils.dart';

import '../emoji/emoji.dart';

// https://discord.com/developers/docs/resources/channel#reaction-object-reaction-structure
final class Reaction {
  const Reaction._(
    this.count,
    this.me,
    this.emoji,
  );

  // times this emoji has been used to react
  final int count;

  // whether the current user reacted using this emoji
  final bool me;

  // emoji information
  final Emoji emoji;

  factory Reaction.fromJson(JsonMap json) {
    if (json
        case {
          'count': int count,
          'me': bool me,
          'emoji': JsonMap emojiJsonMap,
        }) {
      return Reaction._(
        count,
        me,
        Emoji.fromJson(emojiJsonMap),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'count': int,
          'me': bool,
          'emoji': JsonMap,
        }
      ''', json);
    }
  }
}
