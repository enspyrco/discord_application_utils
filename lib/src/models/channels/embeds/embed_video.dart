//  https://discord.com/developers/docs/resources/channel#embed-object-embed-video-structure
import 'package:json_utils/json_utils.dart';

final class EmbedVideo {
  const EmbedVideo._(
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  );

  // source url of video
  final String? url;

  // a proxied url of the video
  final String? proxyUrl;

  // height of video
  final int? height;

  // width of video
  final int? width;

  factory EmbedVideo.fromJson(JsonMap json) {
    if (json
        case {
          'url': String url,
          'proxy_url': String? proxyUrl,
          'height': int? height,
          'width': int? width,
        }) {
      return EmbedVideo._(
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
