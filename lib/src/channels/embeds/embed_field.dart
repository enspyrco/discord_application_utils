import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/channel#embed-object-embed-field-structure
final class EmbedField {
  const EmbedField._(this.name, this.value, this.inline);
  // name of the field
  final String name;

  // value of the field
  final String value;

  // whether or not this field should display inline
  final bool? inline;

  factory EmbedField.fromJson(JsonMap json) {
    if (json
        case {
          'name': String name,
          'value': String value,
          'inline': bool? inline,
        }) {
      return EmbedField._(
        name,
        value,
        inline,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'name': String,
          'value': String,
          'inline': bool?,
        }
      ''', json);
    }
  }
}
