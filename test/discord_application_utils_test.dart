import 'package:discord_application_utils/discord_application_utils.dart';
import 'package:test/test.dart';

void main() {
  const testJson = {
    //...
    "application_id": "alsdkflaksdf",
    "token": "qoweuropqweurio",
    "data": {
      "type": 1,
      "name": "run",
      "options": [
        {"value": "3 + 4", "type": 3, "name": "code"}
      ],
      "id": "940033460431622165"
    }
  };

  test('extractInfo() correctly parses json', () async {
    final InteractionData data = extractMessageCommandInfo(testJson);
    print(data);
    expect(data.applicationId, 'alsdkflaksdf');
    expect(data.token, 'qoweuropqweurio');
    expect(data.token, '3 + 4');
  });
}
