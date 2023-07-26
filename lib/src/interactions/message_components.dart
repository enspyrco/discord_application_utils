import 'package:json_utils/json_utils.dart';

import '../emoji/emoji.dart';

// TODO: add remaining MessageComponent types 3-8

// https://discord.com/developers/docs/interactions/message-components#message-components
final class MessageComponent {
  MessageComponent(this.type);

  //
  final int type;

  factory MessageComponent.fromJson(JsonMap json) {
    if (json
        case {
          'type': int type,
        }) {
      return switch (type) {
        1 => ActionRowComponent.fromJson(json),
        2 => ButtonComponent.fromJson(json),
        _ => throw '$type does not correspond to a valid MessageComponent.',
      };
    } else {
      throw MalformedJsonMapException({'type': int}, json);
    }
  }
}

// https://discord.com/developers/docs/interactions/message-components#action-rows
final class ActionRowComponent extends MessageComponent {
  ActionRowComponent._(this.components) : super(1);

  //
  final List<MessageComponent> components;

  factory ActionRowComponent.fromJson(JsonMap json) {
    if (json
        case {
          'components': JsonList componentsJsonList,
        }) {
      return ActionRowComponent._(
        List<MessageComponent>.from(componentsJsonList),
      );
    } else {
      throw MalformedJsonMapException({}, json);
    }
  }
}

// https://discord.com/developers/docs/interactions/message-components#button-object
final class ButtonComponent extends MessageComponent {
  ButtonComponent._(
    this.style,
    this.label,
    this.emoji,
    this.customId,
    this.url,
    this.disabled,
  ) : super(2);

  // A button style
  final int style;

  // Text that appears on the button; max 80 characters
  final String? label;

  // name, id, and animated
  final Emoji? emoji;

  // Developer-defined identifier for the button; max 100 characters
  final String? customId;

  // URL for link-style buttons
  final String? url;

  // Whether the button is disabled (defaults to false)
  final bool? disabled;

  factory ButtonComponent.fromJson(JsonMap json) {
    if (json
        case {
          'style': int style,
          'label': String? label,
          'emoji': Emoji? emoji,
          'customId': String? customId,
          'url': String? url,
          'disabled': bool? disabled,
        }) {
      return ButtonComponent._(
        style,
        label,
        emoji,
        customId,
        url,
        disabled,
      );
    } else {
      throw MalformedJsonMapException({
        'style': int,
        'label': Nullable<String>,
        'emoji': Nullable<JsonMap>,
        'customId': Nullable<String>,
        'url': Nullable<String>,
        'disabled': Nullable<bool>,
      }, json);
    }
  }
}
