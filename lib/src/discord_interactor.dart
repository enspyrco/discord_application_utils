import 'package:http/http.dart';
import 'package:json_utils/json_utils.dart';

import 'models/interactions/interaction.dart';
import 'models/interactions/interaction_data_option.dart';
import 'response_exception.dart';

class DiscordInteractor {
  DiscordInteractor({required JsonMap interactionJson})
      : _interaction = Interaction.fromJson(interactionJson) {
    // construct the uri we will use to update the Discord response
    _responseUrl = Uri.parse(
        "https://discord.com/api/v8/webhooks/${_interaction.applicationId}/${_interaction.token}/messages/@original");
  }

  final Interaction _interaction;
  late final Uri _responseUrl;

  // first.value
  T? getOptionValue<T>({required String name}) {
    if (_interaction.data?.options == null) return null;
    if (T is! String || T is! num || T is! bool) {
      throw 'Interaction Options can have values of type int, double, string or bool, but not $T';
    }
    for (InteractionDataOption option in _interaction.data!.options!) {
      if (option.name == name) {
        if (option.value is! T) {
          throw 'getInteractionOptionValues was called with type $T but options has type ${_interaction.data?.options.runtimeType}';
        } else {
          return option.value as T;
        }
      }
    }

    return null;
  }

  // Make a http call to edit the interaction response
  Future<void> updateInteractionResponse(Object jsonValue) async {
    var response = await patch(_responseUrl, body: {'content': jsonValue});
    if (response.statusCode != 200) {
      throw ResponseException(response);
    }
  }
}
