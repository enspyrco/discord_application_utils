import 'package:discord_application_utils/src/channels/embeds/embed_provider.dart';
import 'package:discord_application_utils/src/channels/embeds/embed_thumbnail.dart';
import 'package:json_utils/json_utils.dart';

import 'embed_author.dart';
import 'embed_field.dart';
import 'embed_footer.dart';
import 'embed_image.dart';
import 'embed_video.dart';

// https://discord.com/developers/docs/resources/channel#embed-object-embed-structure
final class Embed {
  const Embed._(
    this.title,
    this.type,
    this.description,
    this.url,
    this.timestamp,
    this.color,
    this.footer,
    this.image,
    this.thumbnail,
    this.video,
    this.provider,
    this.author,
    this.fields,
  );

  // title of embed
  final String? title;

  // type of embed (always "rich" for webhook embeds)
  final String? type;

  // description of embed
  final String? description;

  // url of embed
  final String? url;

  // timestamp of embed content
  final DateTime? timestamp;

  // color code of the embed
  final int? color;

  // footer information
  final EmbedFooter? footer;

  // image object	image information
  final EmbedImage? image;

  // thumbnail information
  final EmbedThumbnail? thumbnail;

  // video information
  final EmbedVideo? video;

  // provider information
  final EmbedProvider? provider;

  // author information
  final EmbedAuthor? author;

  // fields information
  final List<EmbedField> fields;

  factory Embed.fromJson(JsonMap json) {
    if (json
        case {
          'title': String? title,
          'type': String? type,
          'description': String? description,
          'url': String? url,
          'timestamp': String? timestampString,
          'color': int? color,
          'footer': JsonMap? footerJsonMap,
          'image': JsonMap? imageJsonMap,
          'thumbnail': JsonMap? thumbnailJsonMap,
          'video': JsonMap? videoJsonMap,
          'provider': JsonMap? providerJsonMap,
          'author': JsonMap? authorJsonMap,
          'fields': JsonList? fieldsJsonList,
        }) {
      return Embed._(
        title,
        type,
        description,
        url,
        timestampString == null ? null : DateTime.parse(timestampString),
        color,
        footerJsonMap == null ? null : EmbedFooter.fromJson(footerJsonMap),
        imageJsonMap == null ? null : EmbedImage.fromJson(imageJsonMap),
        thumbnailJsonMap == null
            ? null
            : EmbedThumbnail.fromJson(thumbnailJsonMap),
        videoJsonMap == null ? null : EmbedVideo.fromJson(videoJsonMap),
        providerJsonMap == null
            ? null
            : EmbedProvider.fromJson(providerJsonMap),
        authorJsonMap == null ? null : EmbedAuthor.fromJson(authorJsonMap),
        fieldsJsonList == null ? [] : List<EmbedField>.from(fieldsJsonList),
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'title': String?,
          'type': String?,
          'description': String?,
          'url': String?,
          'timestamp': DateTime?,
          'color': int?,
          'footer': EmbedFooter?,
          'image': EmbedImage?,
          'thumbnail': EmbedThumbnail?,
          'video': EmbedVideo?,
          'provider': EmbedProvider?,
          'author': EmbedAuthor?,
          'fields': List<EmbedField>,
        }
      ''', json);
    }
  }
}
