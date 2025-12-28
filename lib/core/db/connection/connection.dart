import 'package:drift/drift.dart';

import 'native.dart' if (dart.library.html) 'web.dart';

/// This is a stub for the generated `connect` function.
/// It will be overridden by the actual `connect` function from either `native.dart` or `web.dart`
/// depending on the platform.
DatabaseConnection connect() {
  throw UnsupportedError('Unsupported platform: Cannot create a database connection');
}