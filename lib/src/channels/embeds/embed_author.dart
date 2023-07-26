import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/channel#embed-object-embed-author-structure
final class EmbedAuthor {
  const EmbedAuthor._(
    this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  );

  // name of author
  final String name;

  // url of author (only supports http(s))
  final String? url;

  // url of author icon (only supports http(s) and attachments)
  final String? iconUrl;

  // a proxied url of author icon
  final String? proxyIconUrl;

  factory EmbedAuthor.fromJson(JsonMap json) {
    if (json
        case {
          'name': String name,
          'url': String? url,
          'icon_url': String? iconUrl,
          'proxy_icon_url': String? proxyIconUrl,
        }) {
      return EmbedAuthor._(
        name,
        url,
        iconUrl,
        proxyIconUrl,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'name': String,
          'url': String?,
          'icon_url': String?,
          'proxy_icon_url': String?,
        }
      ''', json);
    }
  }
}
