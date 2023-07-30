// https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure
import 'package:json_utils/json_utils.dart';

final class EmbedThumbnail {
  const EmbedThumbnail._(
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  );

  // source url of thumbnail (only supports http(s) and attachments)
  final String url;

  // a proxied url of the thumbnail
  final String? proxyUrl;

  // height of thumbnail
  final int? height;

  // width of thumbnail
  final int? width;

  factory EmbedThumbnail.fromJson(JsonMap json) {
    if (json
        case {
          'url': String url,
          'proxy_url': String? proxyUrl,
          'height': int? height,
          'width': int? width,
        }) {
      return EmbedThumbnail._(
        url,
        proxyUrl,
        height,
        width,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'url': String,
          'proxy_url': String?,
          'height': int?,
          'width': int?,
        }
      ''', json);
    }
  }
}
