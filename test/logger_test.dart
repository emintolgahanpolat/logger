import 'package:flutter_test/flutter_test.dart';

import 'package:logger/logger.dart';

void main() {
  test('logger test', () {
    Log.addListener((tag, msg) => debugPrint(msg));
    Log.i("Info");
    Log.e("Error");
  });
}
