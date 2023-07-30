import 'package:json_utils/json_utils.dart';

import 'welcome_screen_channel.dart';

// https://discord.com/developers/docs/resources/guild#welcome-screen-object
final class WelcomeScreen {
  WelcomeScreen._(
    this.description,
    this.welcomeChannels,
  );

  // the server description shown in the welcome screen
  final String? description;

  // the channels shown in the welcome screen, up to 5
  // array of welcome screen channel objects
  final List<WelcomeScreenChannel> welcomeChannels;

  factory WelcomeScreen.fromJson(JsonMap json) {
    if (json
        case {
          'description': String? description,
          'welcome_channels': List<WelcomeScreenChannel> welcomeChannels,
        }) {
      return WelcomeScreen._(
        description,
        welcomeChannels,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'description': String?,
          'welcome_channels': JsonList,
        }
      ''', json);
    }
  }
}
