import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';


abstract class IAuthLocalDataSource {
  Future<User?> login(String username);
  Future<void> seedUser(UserEntity user, String password);
  Future<void> updateUser(UserEntity user, {String? newPassword});
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final AppDatabase _appDatabase;

  AuthLocalDataSource(this._appDatabase);

  @override
  Future<User?> login(String username) async {
    return (_appDatabase.select(_appDatabase.users)..where((u) => u.username.equals(username))).getSingleOrNull();
  }

  @override
  Future<void> seedUser(UserEntity user, String password) async {
    final passwordHash = sha256.convert(utf8.encode(password)).toString();
    final userCompanion = UsersCompanion(
      username: Value(user.username),
      password: Value(passwordHash),
      fullNameAr: Value(user.fullNameAr),
      fullNameEn: Value(user.fullNameEn),
    );
    await _appDatabase.into(_appDatabase.users).insert(userCompanion);
  }

  @override
  Future<void> updateUser(UserEntity user, {String? newPassword}) async {
    final updates = UsersCompanion(
      fullNameAr: Value(user.fullNameAr),
      fullNameEn: Value(user.fullNameEn),
      isActive: Value(user.isActive),
    );

    if (newPassword != null) {
      final passwordHash = sha256.convert(utf8.encode(newPassword)).toString();
      updates.copyWith(password: Value(passwordHash));
    }
    
    await (_appDatabase.update(_appDatabase.users)..where((u) => u.userId.equals(user.userId))).write(updates);
  }
}
