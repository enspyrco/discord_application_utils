import 'dart:convert';

import 'package:discord_application_utils/discord_application_utils.dart';
import 'package:json_utils/json_utils.dart';
import 'package:test/test.dart';

import 'data/encoded_chat_input_command.dart' as test_data;

void main() {
  //
  test('An invalid Discord message gets caught', () {
    final String jsonString = utf8.decode(base64.decode(test_data.encodedData));
    final JsonMap decodedJson = json.decode(jsonString) as JsonMap;
    print('decodedMessageJson: $jsonString');

    final Interaction interaction = Interaction.fromJson(decodedJson);

    // expect(interactionData.applicationId, '1126810994593771540');
    // expect(data.token, 'fakeToken0');
    // expect(
    //     data.content,
    //     'A Flutter app for presentations (something like Google Slides/Powerpoint/Keynote) with:\n'
    //     '- a web app that everyone \'warches\'\n'
    //     '-  the presenter moves through the slides\n'
    //     '- there is also mobile apps for voting / answering questions \n'
    //     '- slides with a question shows stats for answers as they come in\n'
    //     '- stretch goal: extend the question/answers feature to include solving coding challenges');
  });

  // test('The "value" is extracted correctly from a valid Discord message ', () {
  //   final bodyJson =
  //       jsonDecode(test_data.validMessageWithValidDart)['jsonPayload'];

  //   InteractionData data = extractMessageCommandInfo(bodyJson);

  //   // The expected values are from the test data, which was a real message extracted from the server logs
  //   expect(data.applicationId, '938746298146885634');
  //   expect(data.token, 'fakeToken1');
  //   expect(
  //       data.token,
  //       '```Dart\n'
  //       'int i = 10;\n'
  //       'int j = 20;\n'
  //       'return i*j;\n'
  //       '```');
  // });
}
