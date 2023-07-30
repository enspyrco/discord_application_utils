import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/applcation#install-params-object-install-params-structure
final class InstallParams {
  InstallParams._(
    this.scopes,
    this.permissions,
  );

  // the scopes to add the application to the server with
  final List<String> scopes;

  // the permissions to request for the bot role
  final String permissions;

  factory InstallParams.fromJson(JsonMap json) {
    if (json
        case {
          'scopes': JsonList scopesJsonList,
          'permissions': String permissions,
        }) {
      return InstallParams._(
        List<String>.from(scopesJsonList),
        permissions,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'scopes': JsonList,
          'permissions': String,
        }
      ''', json);
    }
  }
}
