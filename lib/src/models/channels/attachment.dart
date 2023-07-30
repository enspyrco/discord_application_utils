import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';

// https://discord.com/developers/docs/resources/channel#attachment-object-attachment-structure
final class Attachment {
  const Attachment._(
    this.id,
    this.filename,
    this.description,
    this.contentType,
    this.size,
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
    this.ephemeral,
    this.durationSecs,
    this.waveform,
    this.flags,
  );

  // attachment id
  final Snowflake id;

  // name of file attached
  final String filename;

  // description for the file (max 1024 characters)
  final String? description;

  // the attachment's media type
  final String? contentType;

  // size of file in bytes
  final int size;

  // source url of file
  final String url;

  // a proxied url of file
  final String proxyUrl;

  // height of file (if image)
  final int? height;

  // width of file (if image)
  final int? width;

  // whether this attachment is ephemeral
  // Ephemeral attachments will automatically be removed after a set period of time. Ephemeral attachments on messages are guaranteed to be available as long as the message itself exists.
  final bool? ephemeral;

  // the duration of the audio file (currently for voice messages)
  final double? durationSecs;

  // base64 encoded bytearray representing a sampled waveform (currently for voice messages)
  final String? waveform;

  // attachment flags combined as a bitfield
  final int? flags;

  factory Attachment.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'filename': String filename,
          'description': String? description,
          'content_type': String? contentType,
          'size': int size,
          'url': String url,
          'proxy_url': String proxyUrl,
          'height': int? height,
          'width': int? width,
          'ephemeral': bool? ephemeral,
          'duration_secs': double? durationSecs,
          'waveform': String? waveform,
          'flags': int? flags,
        }) {
      return Attachment._(
        Snowflake.fromJson(idString),
        filename,
        description,
        contentType,
        size,
        url,
        proxyUrl,
        height,
        width,
        ephemeral,
        durationSecs,
        waveform,
        flags,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id: String,
          'filename: String,
          'description: String?,
          'content_type: String?,
          'size: int,
          'url: String,
          'proxy_url: String,
          'height: int?,
          'width: int?,
          'ephemeral: bool?,
          'duration_secs: double?,
          'waveform: String?,
          'flags: int?,
        }
      ''', json);
    }
  }
}
