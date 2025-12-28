import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

// Create a single instance of the database
final appDatabase = AppDatabase();

// Provide the single instance through the provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return appDatabase;
});
