import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';

class UserManagementRepositoryImpl implements UserManagementRepository {
  final db.AppDatabase database;
  final AuthLocalDataSource authLocalDataSource;

  UserManagementRepositoryImpl(this.database, this.authLocalDataSource);

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final usersList = await database.select(database.users).get();
    return usersList.map((user) => UserEntity(
      userId: user.userId,
      username: user.username,
      fullNameAr: user.fullNameAr,
      fullNameEn: user.fullNameEn,
      isActive: user.isActive,
    )).toList();
  }

  @override
  Future<void> addUser(UserEntity user, String password) {
    final companion = db.UsersCompanion.insert(
      username: user.username,
      passwordHash: password, // Will be hashed by the datasource
      fullNameAr: user.fullNameAr,
      fullNameEn: user.fullNameEn,
      isActive: Value(user.isActive),
    );
    // Use the auth datasource to leverage its password hashing
    return authLocalDataSource.insertUser(companion);
  }

  @override
  Future<void> updateUser(UserEntity user, {String? newPassword}) {
    final companion = db.UsersCompanion(
      userId: Value(user.userId),
      username: Value(user.username),
      fullNameAr: Value(user.fullNameAr),
      fullNameEn: Value(user.fullNameEn),
      isActive: Value(user.isActive),
      // Only update password if a new one is provided
      passwordHash: newPassword != null ? Value(newPassword) : const Value.absent(),
    );

    if (newPassword != null) {
      // If there's a new password, we need to hash it.
      // This is a bit tricky as the hashing is in the datasource.
      // A better design would be a shared crypto service. For now, we'll replicate.
      final localAuth = authLocalDataSource as AuthLocalDataSourceImpl;
      final hashedCompanion = localAuth.hashPasswordForUpdate(companion);
      return (database.update(database.users)..where((u) => u.userId.equals(user.userId))).write(hashedCompanion);
    } else {
      return (database.update(database.users)..where((u) => u.userId.equals(user.userId))).write(companion);
    }
  }
}
