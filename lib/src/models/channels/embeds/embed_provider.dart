// https://discord.com/developers/docs/resources/channel#embed-object-embed-provider-structure
import 'package:json_utils/json_utils.dart';

final class EmbedProvider {
  const EmbedProvider._(this.name, this.url);

  // name of provider
  final String? name;

  // url of provider
  final String? url;

  factory EmbedProvider.fromJson(JsonMap json) {
    if (json
        case {
          'name': String? name,
          'url': String? url,
        }) {
      return EmbedProvider._(
        name,
        url,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'name': String?
          'url': String?,
        }
      ''', json);
    }
  }
}
