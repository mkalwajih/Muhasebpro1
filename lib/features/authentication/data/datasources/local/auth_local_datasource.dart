
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

abstract class IAuthLocalDataSource {
  Future<User?> login(String username, String password);
  Future<void> seedUser(UserEntity user, String password);
  Future<void> updateUser(UsersCompanion companion);
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final AppDatabase _appDatabase;

  AuthLocalDataSource(this._appDatabase);

  @override
  Future<User?> login(String username, String password) async {
    final passwordHash = sha256.convert(utf8.encode(password)).toString();
    final user = await (_appDatabase.select(_appDatabase.users)
          ..where((u) => u.username.equals(username) & u.password.equals(passwordHash)))
        .getSingleOrNull();
    return user;
  }

  @override
  Future<void> seedUser(UserEntity user, String password) async {
    final passwordHash = sha256.convert(utf8.encode(password)).toString();

    // Explicitly providing all fields to prevent null issues if schema defaults fail
    final userCompanion = UsersCompanion(
      username: Value(user.username),
      password: Value(passwordHash),
      fullNameAr: Value(user.fullNameAr),
      fullNameEn: Value(user.fullNameEn),
      isActive: Value(user.isActive),
      isBiometricEnabled: const Value(false),
      isDeviceLinked: const Value(false),
      failedLoginAttempts: const Value(0),
    );

    await _appDatabase.into(_appDatabase.users).insert(userCompanion);
  }

  @override
  Future<void> updateUser(UsersCompanion companion) async {
     await _appDatabase.update(_appDatabase.users).replace(companion);
  }
}
