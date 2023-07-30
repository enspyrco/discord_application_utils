// https://discord.com/developers/docs/resources/channel#message-object-message-activity-structure
import 'package:json_utils/json_utils.dart';

final class MessageActivity {
  const MessageActivity._(this.type, this.partyId);
  // type of message activity
  final int type;

  // party_id from a Rich Presence event
  final String? partyId;

  factory MessageActivity.fromJson(JsonMap json) {
    if (json
        case {
          'type': int type,
          'party_id': String? partyId,
        }) {
      return MessageActivity._(
        type,
        partyId,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'type': int,
          'party_id': String?,
        }
      ''', json);
    }
  }
}
