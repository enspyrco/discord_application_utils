import 'package:json_utils/json_utils.dart';

import '../channels/channel.dart';
import '../channels/messages/message.dart';
import 'interaction_type.dart';
import '../guild_member.dart';
import '../user.dart';
import 'interaction_data.dart';

// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object
class Interaction {
  Interaction._(
    this.id,
    this.applicationId,
    this.type,
    this.data,
    this.guildId,
    this.channel,
    this.channelId,
    this.member,
    this.user,
    this.token,
    this.version,
    this.message,
    this.appPermissions,
    this.locale,
    this.guildLocale,
  );

  // ID of the interaction
  // snowflake
  final String id;

  // ID of the application this interaction is for
  // snowflake
  final String applicationId;

  // Type of interaction
  final InteractionType type;

  // Interaction data payload
  // Always present on application command, message component, and modal submit
  // types. It is optional for future-proofing against new interaction types
  final InteractionData? data;

  // Guild that the interaction was sent from
  // snowflake
  final String? guildId;

  // Channel that the interaction was sent from
  // partial channel object
  final Channel? channel;

  // Channel that the interaction was sent from
  // snowflake
  final String? channelId;

  // Guild member data for the invoking user, including permissions
  // guild member object
  // member is sent when the interaction is invoked in a guild, and user is sent when invoked in a DM
  final GuildMember? member;

  // User object for the invoking user, if invoked in a DM
  // user object
  final User? user;

  // Continuation token for responding to the interaction
  final String token;

  // Read-only property, always 1
  final int version;

  // For components, the message they were attached to
  // message object
  final Message? message;

  // Bitwise set of permissions the app or bot has within the channel the interaction was sent from
  final String? appPermissions;

  // Selected language of the invoking user
  // This is available on all interaction types except PING
  final String? locale;

  // Guild's preferred locale, if invoked in a guild
  final String? guildLocale;

  factory Interaction.fromJson(JsonMap json) {
    if (json
        case {
          'id': String id,
          'application_id': String applicationId,
          'type': int type,
          'token': String token,
          'version': int version,
        }) {
      var (
        JsonMap? data,
        String? guildId,
        JsonMap? channel,
        String? channelId,
        JsonMap? member,
        JsonMap? user,
        JsonMap? messsage,
        String? appPermissions,
        String? locale,
        String? guildLocale,
      ) = (
        json['data'] as JsonMap?,
        json['guild_id'] as String?,
        json['channel'] as JsonMap?,
        json['channel_id'] as String?,
        json['member'] as JsonMap?,
        json['user'] as JsonMap?,
        json['message'] as JsonMap?,
        json['app_permissions'] as String?,
        json['locale'] as String?,
        json['guild_locale'] as String?,
      );
      return Interaction._(
        id,
        applicationId,
        InteractionType.fromInt(type),
        data == null ? null : InteractionData.fromJson(data),
        guildId,
        channel == null ? null : Channel.fromJson(channel),
        channelId,
        member == null ? null : GuildMember.fromJson(member),
        user == null ? null : User.fromJson(user),
        token,
        version,
        messsage == null ? null : Message.fromJson(messsage),
        appPermissions,
        locale,
        guildLocale,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'application_id': String,
        'type': int,
        'data': Nullable<JsonMap>,
        'guild_id': Nullable<String>,
        'channel': Nullable<JsonMap>,
        'channel_id': Nullable<String>,
        'member': Nullable<JsonMap>,
        'user': Nullable<JsonMap>,
        'token': String,
        'version': int,
        'message': Nullable<JsonMap>,
        'app_permissions': Nullable<String>,
        'locale': Nullable<String>,
        'guild_locale': Nullable<String>,
      }, json);
    }
  }
}


// final String id = json['id'] as String? ??
//         (throw MalformedJsonException(
//             'Missing "application_id" key in first value of "messages" object.',
//             json));

//     final String applicationId = json['application_id'] as String? ??
//         (throw MalformedJsonException(
//             'Missing "application_id" key in first value of "messages" object.',
//             json));

//     final data = json['data'] as JsonMap? ??
//         (throw MalformedJsonException('Missing "data" key.', json));

//     final commandType = data['type'] as int? ??
//         (throw MalformedJsonException(
//             'Missing "type" key in "data" value.', json));

//     if (commandType != ApplicationCommandType.chatInput.value &&
//         commandType != ApplicationCommandType.message.value &&
//         commandType != ApplicationCommandType.user.value) {
//       throw InvalidCommandTypeException(found: commandType);
//     }

//     final resolved = data['resolved'] as JsonMap? ??
//         (throw MalformedJsonException(
//             'Missing "resolved" key in "data" value.', json));

//     final messages = resolved['messages'] as JsonMap? ??
//         (throw MalformedJsonException(
//             'Missing "messages" key in "resolved" value.', json));

//     if (messages.values.isEmpty) {
//       throw MalformedJsonException('"messages" should not be empty.', json);
//     }

//     final firstMessage = messages.values.first as JsonMap;

//     final content = firstMessage['content'] as String? ??
//         (throw MalformedJsonException(
//             'Missing "content" key in first value of "messages" object.',
//             json));

//     final String token = json['token'] as String? ??
//         (throw MalformedJsonException(
//             'Missing "token" key in first value of "messages" object.', json));