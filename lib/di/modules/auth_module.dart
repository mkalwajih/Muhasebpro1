import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/di/modules/auth_providers.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  final roleManagementRepository = ref.watch(roleManagementRepositoryProvider);
  final db = ref.watch(appDatabaseProvider);
  
  return AuthRepositoryImpl(
    authLocalDataSource: localDataSource,
    roleManagementRepository: roleManagementRepository,
    database: db,
  );
});
