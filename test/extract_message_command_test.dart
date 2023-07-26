import 'dart:convert';

import 'package:discord_application_utils/discord_application_utils.dart';
import 'package:test/test.dart';

import 'data/embedded_message_command.dart' as test_data;

void main() {
  //
  test('An invalid Discord message gets caught', () {
    final bodyJson =
        jsonDecode(test_data.invalidMessageWithJustText)['jsonPayload'];
    // final bodyJson = old_test_data.body;

    Interaction interaction = Interaction.fromJson(bodyJson);

    expect(interaction.applicationId, '938746298146885634');
    expect(interaction.token, 'fakeToken0');
    expect(
        interaction.data?.resolved?.messages?.entries.first.value.content,
        'A Flutter app for presentations (something like Google Slides/Powerpoint/Keynote) with:\n'
        '- a web app that everyone \'warches\'\n'
        '-  the presenter moves through the slides\n'
        '- there is also mobile apps for voting / answering questions \n'
        '- slides with a question shows stats for answers as they come in\n'
        '- stretch goal: extend the question/answers feature to include solving coding challenges');
  });

  test('The "value" is extracted correctly from a valid Discord message ', () {
    final bodyJson =
        jsonDecode(test_data.validMessageWithValidDart)['jsonPayload'];

    Interaction interaction = Interaction.fromJson(bodyJson);

    // The expected values are from the test data, which was a real message extracted from the server logs
    expect(interaction.applicationId, '938746298146885634');
    expect(interaction.token, 'fakeToken1');
    expect(
        interaction.data?.resolved?.messages?.entries.first.value.content,
        '```Dart\n'
        'int i = 10;\n'
        'int j = 20;\n'
        'return i*j;\n'
        '```');
  });
}
