// https://discord.com/developers/docs/resources/channel#embed-object-embed-image-structure
import 'package:json_utils/json_utils.dart';

final class EmbedImage {
  const EmbedImage._(
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  );

  // source url of image (only supports http(s) and attachments)
  final String url;

  // a proxied url of the image
  final String? proxyUrl;

  // integer	height of image
  final int? height;

  // width of image
  final int? width;

  factory EmbedImage.fromJson(JsonMap json) {
    if (json
        case {
          'url': String url,
          'proxy_url': String? proxyUrl,
          'height': int? height,
          'width': int? width,
        }) {
      return EmbedImage._(
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
