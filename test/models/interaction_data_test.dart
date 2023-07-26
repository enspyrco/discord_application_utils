import 'package:discord_application_utils/discord_application_utils.dart';
import 'package:test/test.dart';

void main() {
  const testJson = {
    'id': '1234',
    'name': 'Nick',
    'type': 1,
    // 'resolved': null,
    // 'options': null,
    // 'guild_id': null,
    // 'target_id': null,
  };

  test('InteractionData.fromJson correctly parses json', () async {
    final InteractionData data = InteractionData.fromJson(testJson);
    print(data);
    expect(data.id, '1234');
    expect(data.name, 'Nick');
    expect(data.type, 1);
  });
}
