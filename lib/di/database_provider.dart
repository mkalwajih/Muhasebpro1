import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});