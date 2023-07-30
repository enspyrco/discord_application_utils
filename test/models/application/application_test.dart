import 'package:discord_application_utils/src/models/application/application.dart';
import 'package:test/test.dart';

import '../../data/example_application_object.dart';

void main() {
  test('Application.fromJson correctly parses json', () async {
    final Application application = Application.fromJson(applicationObjectJson);
    print(application);
    // expect(data.applicationId, 'alsdkflaksdf');
    // expect(data.token, 'qoweuropqweurio');
    // expect(data.token, '3 + 4');
  });
}
