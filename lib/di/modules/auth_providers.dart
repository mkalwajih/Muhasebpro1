import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AuthLocalDataSource(db);
});
