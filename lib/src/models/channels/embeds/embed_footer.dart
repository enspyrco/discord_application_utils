import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/channel#embed-object-embed-footer-structure
final class EmbedFooter {
  const EmbedFooter._(
    this.text,
    this.iconUrl,
    this.proxyIconUrl,
  );

  // footer text
  final String text;

  // url of footer icon (only supports http(s) and attachments)
  final String iconUrl;

  // a proxied url of footer icon
  final String? proxyIconUrl;

  factory EmbedFooter.fromJson(JsonMap json) {
    if (json
        case {
          'text': String text,
          'icon_url': String iconUrl,
          'proxy_icon_url': String? proxyIconUrl,
        }) {
      return EmbedFooter._(
        text,
        iconUrl,
        proxyIconUrl,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'text': String,
          'icon_url': String,
          'proxy_icon_url': String?,
        }
      ''', json);
    }
  }
}
